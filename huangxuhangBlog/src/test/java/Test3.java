import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.Term;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.junit.Test;
import org.wltea.analyzer.lucene.IKAnalyzer;

import java.io.File;

public class Test3 {
    /* 测试：修改索引
     * 注意：
     * 	A：Lucene修改功能底层会先删除，再把新的文档添加。
     * 	B：修改功能会根据Term进行匹配，所有匹配到的都会被删除。这样不好
     * 	C：因此，一般我们修改时，都会根据一个唯一不重复字段进行匹配修改。例如ID
     * 	D：但是词条搜索，要求ID必须是字符串。如果不是，这个方法就不能用。
     * 如果ID是数值类型，我们不能直接去修改。可以先手动删除deleteDocuments(数值范围查询锁定ID)，再添加。
     */
    @Test
    public void testUpdate() throws Exception{
        // 创建目录对象
        Directory directory = FSDirectory.open(new File("d:\\indexDir"));
        // 创建配置对象
        IndexWriterConfig conf = new IndexWriterConfig(Version.LATEST, new IKAnalyzer());
        // 创建索引写出工具
        IndexWriter writer = new IndexWriter(directory, conf);

        // 创建新的文档数据
        Document doc = new Document();
        doc.add(new StringField("id","1", Field.Store.YES));
        doc.add(new TextField("title","谷歌地图之父跳槽facebook ", Field.Store.YES));
        /* 修改索引。参数：
         * 	词条：根据这个词条匹配到的所有文档都会被修改
         * 	文档信息：要修改的新的文档数据
         */
        writer.updateDocument(new Term("id","1"), doc);
        // 提交
        writer.commit();
        // 关闭
        writer.close();
    }
    /*
     * 演示：删除索引
     * 注意：
     * 	一般，为了进行精确删除，我们会根据唯一字段来删除。比如ID
     * 	如果是用Term删除，要求ID也必须是字符串类型！
     */
    @Test
    public void testDelete() throws Exception {
        // 创建目录对象
        Directory directory = FSDirectory.open(new File("d:\\indexDir"));
        // 创建配置对象
        IndexWriterConfig conf = new IndexWriterConfig(Version.LATEST, new IKAnalyzer());
        // 创建索引写出工具
        IndexWriter writer = new IndexWriter(directory, conf);

        // 根据词条进行删除
        		writer.deleteDocuments(new Term("title", "谷歌地图之父跳槽"));

        // 根据query对象删除,如果ID是数值类型，那么我们可以用数值范围查询锁定一个具体的ID
        //		Query query = NumericRangeQuery.newLongRange("id", 2L, 2L, true, true);
        //		writer.deleteDocuments(query);

        // 删除所有
        writer.deleteAll();
        // 提交
        writer.commit();
        // 关闭
        writer.close();
    }

}
