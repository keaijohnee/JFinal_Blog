package com.zcm.utils;

import java.io.File;
import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryParser.MultiFieldQueryParser;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.BooleanClause;
import org.apache.lucene.search.Hits;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.wltea.analyzer.IKSegmentation;
import org.wltea.analyzer.Lexeme;
import com.zcm.vo.LuceneVO;

/**
 * IKAnalyzer分词和Lucene检索
 * <p>Company:  91注册码</p>
 * time:2014-04-22
 * @author www.91zcm.com
 * @date 
 * @version 1.1
*/
public class LuceneUtil {
	
	private static String LucenePath = null;
	
	static {
		LucenePath = ReadPropertity.getProperty("lucenePath");
	}
	
	/**
	 * IKAnalyzer分词
	 * @param word
	 * @return
	 * @throws IOException
	 */
	public static List<String> tokenWord(String word) throws IOException{
		List<String> tokenArr = new ArrayList<String>();
		StringReader reader = new StringReader(word);
		/**当为true时，分词器进行最大词长切分**/
		IKSegmentation ik = new IKSegmentation(reader, true);
		Lexeme lexeme = null;
		while ((lexeme = ik.next()) != null){
			tokenArr.add(lexeme.getLexemeText());
		}
		return tokenArr;
	}
	
	/**
	 * 创建索引
	 * @throws Exception
	 */
	public static int createIndex(List<?> list) throws Exception{
		  /**这里放索引文件的位置**/
        File indexDir = new File(LucenePath);   
        Analyzer luceneAnalyzer = new StandardAnalyzer();   
        /**注意最后一个boolean类型的参数：表示是否重新创建，true表示新创建（以前存在时回覆盖）**/
        IndexWriter indexWriter = new IndexWriter(indexDir, luceneAnalyzer,true); 
		for (int i = 0; i < list.size(); i++) {
			 LuceneVO vo = (LuceneVO)list.get(i);
             Document doc = new Document();   
             Field FieldId = new Field("aid", String.valueOf(vo.getAid()),Field.Store.YES, Field.Index.NO);   
             Field FieldTitle = new Field("title", vo.getTitle(), Field.Store.YES,Field.Index.TOKENIZED,Field.TermVector.WITH_POSITIONS_OFFSETS);   
             Field FieldRemark = new Field("remark", vo.getRemark(), Field.Store.YES,Field.Index.TOKENIZED,Field.TermVector.WITH_POSITIONS_OFFSETS); 
             doc.add(FieldId);   
             doc.add(FieldTitle);  
             doc.add(FieldRemark);   
             indexWriter.addDocument(doc);   
		}
		/**查看IndexWriter里面有多少个索引**/
		int num = indexWriter.docCount();
		System.out.println("总共------》" + num);
		indexWriter.optimize();   
	    indexWriter.close();
	    return num;
	}
	
	/**
	 * 创建索引（单个）
	 * @param list
	 * @throws Exception
	 */
	public static void addIndex(LuceneVO vo) throws Exception {  
        /**这里放索引文件的位置**/
        File indexDir = new File(LucenePath);   
        Analyzer luceneAnalyzer = new StandardAnalyzer();   
        IndexWriter indexWriter = new IndexWriter(indexDir, luceneAnalyzer, false); 
        /**增加document到索引去   **/
        Document doc = new Document();   
        Field FieldId = new Field("aid", String.valueOf(vo.getAid()),Field.Store.YES, Field.Index.NO);   
        Field FieldTitle = new Field("title", vo.getTitle(), Field.Store.YES,Field.Index.TOKENIZED,Field.TermVector.WITH_POSITIONS_OFFSETS);   
        Field FieldRemark = new Field("remark", vo.getRemark(), Field.Store.YES,Field.Index.TOKENIZED,Field.TermVector.WITH_POSITIONS_OFFSETS); 
        doc.add(FieldId);   
        doc.add(FieldTitle);  
        doc.add(FieldRemark);   
        indexWriter.addDocument(doc);   
        /**optimize()方法是对索引进行优化 **/  
        indexWriter.optimize();   
        indexWriter.close();   
    }  
	
	/**
	 * 创建索引（多个）
	 * @param list
	 * @throws Exception
	 */
	public static void addIndexs(List<?> list) throws Exception {  
        /**这里放索引文件的位置**/
        File indexDir = new File(LucenePath);   
        Analyzer luceneAnalyzer = new StandardAnalyzer();   
        IndexWriter indexWriter = new IndexWriter(indexDir, luceneAnalyzer,false); 
        /**增加document到索引去   **/
        for (int i=0; i<list.size();i++){   
        	    LuceneVO vo = (LuceneVO)list.get(i);
                Document doc = new Document();   
                Field FieldId = new Field("aid", String.valueOf(vo.getAid()),Field.Store.YES, Field.Index.NO);   
                Field FieldTitle = new Field("title", vo.getTitle(), Field.Store.YES,Field.Index.TOKENIZED,Field.TermVector.WITH_POSITIONS_OFFSETS);   
                Field FieldRemark = new Field("remark", vo.getRemark(), Field.Store.YES,Field.Index.TOKENIZED,Field.TermVector.WITH_POSITIONS_OFFSETS); 
                doc.add(FieldId);   
                doc.add(FieldTitle);  
                doc.add(FieldRemark);   
                indexWriter.addDocument(doc);   
        }   
        /**optimize()方法是对索引进行优化 **/  
        indexWriter.optimize();   
        indexWriter.close();   
    }  
	
	/**
	 * 更新索引（单个）
	 * @param list
	 * @throws Exception
	 */
	public static void updateIndex(LuceneVO vo) throws Exception {  
        /**这里放索引文件的位置**/
        File indexDir = new File(LucenePath);   
        Analyzer luceneAnalyzer = new StandardAnalyzer();   
        IndexWriter indexWriter = new IndexWriter(indexDir, luceneAnalyzer,false); 
        
        /**增加document到索引去   **/
        Document doc = new Document();   
        Field FieldId = new Field("aid", String.valueOf(vo.getAid()),Field.Store.YES, Field.Index.NO);   
        Field FieldTitle = new Field("title", vo.getTitle(), Field.Store.YES,Field.Index.TOKENIZED,Field.TermVector.WITH_POSITIONS_OFFSETS);   
        Field FieldRemark = new Field("remark", vo.getRemark(), Field.Store.YES,Field.Index.TOKENIZED,Field.TermVector.WITH_POSITIONS_OFFSETS); 
        doc.add(FieldId);   
        doc.add(FieldTitle);  
        doc.add(FieldRemark);   
        Term term = new Term("aid",String.valueOf(vo.getAid())); 
        indexWriter.updateDocument(term, doc);
        /**optimize()方法是对索引进行优化 **/  
        indexWriter.optimize();   
        indexWriter.close();   
    } 
	
	/**
	 * 创建索引（多个）
	 * @param list
	 * @throws Exception
	 */
	public static void updateIndexs(List<?> list) throws Exception {  
        /**这里放索引文件的位置**/
        File indexDir = new File(LucenePath);   
        Analyzer luceneAnalyzer = new StandardAnalyzer();   
        IndexWriter indexWriter = new IndexWriter(indexDir, luceneAnalyzer,false); 
        /**增加document到索引去   **/
        for (int i=0; i<list.size();i++){   
        	    LuceneVO vo = (LuceneVO)list.get(i);
                Document doc = new Document();   
                Field FieldId = new Field("aid", String.valueOf(vo.getAid()),Field.Store.YES, Field.Index.NO);   
                Field FieldTitle = new Field("title", vo.getTitle(), Field.Store.YES,Field.Index.TOKENIZED,Field.TermVector.WITH_POSITIONS_OFFSETS);   
                Field FieldRemark = new Field("remark", vo.getRemark(), Field.Store.YES,Field.Index.TOKENIZED,Field.TermVector.WITH_POSITIONS_OFFSETS); 
                doc.add(FieldId);   
                doc.add(FieldTitle);  
                doc.add(FieldRemark);   
                Term term = new Term("aid",String.valueOf(vo.getAid())); 
                indexWriter.updateDocument(term, doc);
        }   
        /**optimize()方法是对索引进行优化 **/  
        indexWriter.optimize();   
        indexWriter.close();   
    }
	
	/**
	 * 创建索引（单个）
	 * @param list
	 * @throws Exception
	 */
	public static void deleteIndex(LuceneVO vo) throws Exception {  
        /**这里放索引文件的位置**/
        File indexDir = new File(LucenePath);   
        Analyzer luceneAnalyzer = new StandardAnalyzer();   
        IndexWriter indexWriter = new IndexWriter(indexDir, luceneAnalyzer,false); 
        Term term = new Term("aid",String.valueOf(vo.getAid())); 
        indexWriter.deleteDocuments(term);
        /**optimize()方法是对索引进行优化 **/  
        indexWriter.optimize();   
        indexWriter.close();   
    }  
	
	/**
	 * 创建索引（多个）
	 * @param list
	 * @throws Exception
	 */
	public static void deleteIndexs(List<?> list) throws Exception {  
        /**这里放索引文件的位置**/
        File indexDir = new File(LucenePath);   
        Analyzer luceneAnalyzer = new StandardAnalyzer();   
        IndexWriter indexWriter = new IndexWriter(indexDir, luceneAnalyzer,false); 
        /**删除索引   **/
        for (int i=0; i<list.size();i++){   
        	    LuceneVO vo = (LuceneVO)list.get(i);
                Term term = new Term("aid",String.valueOf(vo.getAid())); 
                indexWriter.deleteDocuments(term);
        }   
        /**optimize()方法是对索引进行优化 **/  
        indexWriter.optimize();   
        indexWriter.close();   
    }  
	
	/**
	 * 检索数据
	 * @param word
	 * @return
	 */
	public static List<LuceneVO> search(String word) {
		List<LuceneVO> list = new ArrayList<LuceneVO>();
		Hits hits = null;
		try {
			word = QueryParser.escape(word);
			IndexSearcher searcher = new IndexSearcher(LucenePath);
		    String[] queries = {word,word};
		    String[] fields = {"title", "remark"};
		    BooleanClause.Occur[] flags  = {BooleanClause.Occur.SHOULD, BooleanClause.Occur.SHOULD};
		    Query query = MultiFieldQueryParser.parse(queries, fields, flags, new StandardAnalyzer());
			if (searcher != null) {
				/**hits结果**/
				hits = searcher.search(query);
				LuceneVO vo = null;
				for (int i = 0; i < hits.length(); i++) {
					Document doc = hits.doc(i);
					vo = new LuceneVO();
					vo.setAid(Integer.parseInt(doc.get("aid")));
					vo.setRemark(doc.get("remark"));
					vo.setTitle(doc.get("title"));
					list.add(vo);
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 检索文章ID
	 * @param word
	 * @return
	 */
	public static String searchString(String word) {
		String search = "";
		StringBuffer aids = new StringBuffer();
		Hits hits = null;
		try {
			IndexSearcher searcher = new IndexSearcher(LucenePath);
		    String[] queries = {word,word};
		    String[] fields = {"title", "remark"};
		    BooleanClause.Occur[] flags  = {BooleanClause.Occur.SHOULD, BooleanClause.Occur.SHOULD };
		    Query query = MultiFieldQueryParser.parse(queries, fields, flags, new StandardAnalyzer());
			/**hits结果**/
			hits = searcher.search(query);
			for (int i = 0; i < hits.length(); i++) {
				Document doc = hits.doc(i);
				aids.append(Integer.parseInt(doc.get("aid")));
				aids.append(",");
			}
			if(aids.length()>0){
				search = aids.substring(0, aids.length()-1);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return search;
	}

}
