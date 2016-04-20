package org.javatree.www.DAO;

import java.util.List;
import java.util.Map;

import org.javatree.www.VO.Question;
import org.javatree.www.VO.Reply;
import org.javatree.www.VO.Rereply;

public interface QnaDAO {

	public void insertQuestion(Question question);
	public void insertReply(Reply reply);
	public Question selectOneQuestion(int questionno);
	public List<Reply> selectAllReply(int questionno);
	public List<Rereply> selectAllRereply(int replyno);
	public int getTotal();
	public List<Question> selectAllQuestion(Map map);
	public List<Question> gunggumAllQuestionList();
	public List<Question> gunggumRecentQuestionList();
	public List<Question> bestAllQuestionList();
	public List<Question> bestRecentQuestionList();
	
}
