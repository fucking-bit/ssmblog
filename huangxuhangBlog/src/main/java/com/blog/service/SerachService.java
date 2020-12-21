package com.blog.service;


import com.blog.pojo.Article;
import org.apache.lucene.search.Query;


import java.io.IOException;
import java.util.List;

public interface SerachService {

    void testCreate() throws IOException;

    List<Article> search(Query query) throws IOException;

     List<Article> FuzzyQuery(String queryTitle) throws IOException;

}
