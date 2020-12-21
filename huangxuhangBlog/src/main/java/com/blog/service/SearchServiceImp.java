package com.blog.service;

import com.blog.dao.ArticleMapper;
import com.blog.pojo.Article;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.StringField;
import org.apache.lucene.index.*;
import org.apache.lucene.search.*;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.wltea.analyzer.lucene.IKAnalyzer;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Service
public class SearchServiceImp implements SerachService {
    @Autowired
    private ArticleMapper articleMapper;

    @Override
    public void testCreate() throws IOException {
        // 创建文档的集合
        Collection<Document> docs = new ArrayList<>();
        List<Article> list = articleMapper.queryAllArticles();
        // 创建文档对象

        for (int i=0;i<list.size();i++){
            Document document = new Document();
            document.add(new StringField("title", list.get(i).getTitle(), Field.Store.YES));
            System.out.println(list.get(i).getTitle());
            docs.add(document);
        }
        // 索引目录类,指定索引在硬盘中的位置
        Directory directory = FSDirectory.open(new File("d:\\indexDir"));
        // 引入IK分词器
        Analyzer analyzer = new IKAnalyzer();
        // 索引写出工具的配置对象
        IndexWriterConfig conf = new IndexWriterConfig(Version.LATEST, analyzer);
        // 设置打开方式：OpenMode.APPEND 会在索引库的基础上追加新索引。OpenMode.CREATE会先清空原来数据，再提交新的索引
        conf.setOpenMode(IndexWriterConfig.OpenMode.CREATE);

        // 创建索引的写出工具类。参数：索引的目录和配置信息
        IndexWriter indexWriter = new IndexWriter(directory, conf);
        // 把文档集合交给IndexWriter
        indexWriter.addDocuments(docs);
        // 提交
        indexWriter.commit();
        // 关闭
        indexWriter.close();
    }


    //公共查询方法
    @Override
    public List<Article> search(Query query) throws IOException {
        // 索引目录对象
        Directory directory = FSDirectory.open(new File("d:\\indexDir"));
        // 索引读取工具
        IndexReader reader = DirectoryReader.open(directory);
        // 索引搜索工具
        IndexSearcher searcher = new IndexSearcher(reader);

        // 搜索数据,两个参数：查询条件对象要查询的最大结果条数
        // 返回的结果是 按照匹配度排名得分前N名的文档信息（包含查询到的总条数信息、所有符合条件的文档的编号信息）。
        TopDocs topDocs = searcher.search(query, 10);
        // 获取总条数
        System.out.println("本次搜索共找到" + topDocs.totalHits + "条数据");
        ScoreDoc[] scoreDocs = topDocs.scoreDocs;
        List<Article> articles = new ArrayList<>();
        Article article = new Article();
        for (ScoreDoc scoreDoc : scoreDocs) {
            // 取出文档编号
            int docID = scoreDoc.doc;
            // 根据编号去找文档
            Document doc = reader.document(docID);
            article.setTitle(doc.get("title"));
            System.out.println(article.getTitle());
            articles.add(article);
        }
        System.out.println(articles);
        return articles;
    }

    @Override
    public List<Article> FuzzyQuery(String queryTitle) throws IOException {
        Query query = new FuzzyQuery(new Term("title",queryTitle),2);
        Query query2 = new WildcardQuery(new Term("title", queryTitle));

        List<Article> articles1 = search(query);
        List<Article> articles2 = search(query2);

        List<Article> articles3 = new ArrayList<>();
        if (articles1 != null){
            for (int i =0;i<articles1.size();i++) {
                Article article = articleMapper.querryArticlesByTitle(articles1.get(i).getTitle());
                articles3.add(article);
            }
        }else {
            for (int i =0;i<articles2.size();i++) {
                Article article = articleMapper.querryArticlesByTitle(articles1.get(i).getTitle());
                articles3.add(article);
            }
        }
        System.out.println(articles3);
        return articles3;
    }


}
