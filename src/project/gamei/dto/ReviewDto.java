package project.gamei.dto;

import java.sql.Timestamp;

public class ReviewDto {
	private int rid;
	private int rscore;	
	private String rtext;
	private String mid;
	private String mphoto;
	private String mnickname;
	private String gid;
	private Timestamp rrdate;
	private int allCount;
	private int score1;
	private int score2;
	private int score3;
	private int score4;
	private int score5;	
	
	public ReviewDto() {}
	public ReviewDto(int rscore, String rtext, String mid, String gid) {
		super();
		this.rscore = rscore;
		this.rtext = rtext;
		this.mid = mid;
		this.gid = gid;		
	}
	
	public ReviewDto(int rid, int rscore, String rtext, String mid, String mphoto, String mnickname, String gid, Timestamp rrdate) {		
		this.rid = rid;
		this.rscore = rscore;
		this.rtext = rtext;
		this.mid = mid;
		this.mphoto = mphoto;
		this.mnickname = mnickname;
		this.gid = gid;
		this.rrdate = rrdate;
	}
	
	public ReviewDto(int rid, int rscore, String rtext, String mid, String gid, Timestamp rrdate) {
		this.rid = rid;
		this.rscore = rscore;
		this.rtext = rtext;
		this.mid = mid;
		this.gid = gid;
		this.rrdate = rrdate;		
	}
	
	
	public ReviewDto(int allCount, int score1, int score2, int score3, int score4, int score5) {
		this.allCount = allCount;
		this.score1 = score1;
		this.score2 = score2;
		this.score3 = score3;
		this.score4 = score4;
		this.score5 = score5;		
	}	
				
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public int getRscore() {
		return rscore;
	}
	public void setRscore(int rscore) {
		this.rscore = rscore;
	}
	public String getRtext() {
		return rtext;
	}
	public void setRtext(String rtext) {
		this.rtext = rtext;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
			
	public String getMphoto() {
		return mphoto;
	}
	public void setMphoto(String mphoto) {
		this.mphoto = mphoto;
	}	
	
	public String getMnickname() {
		return mnickname;
	}
	public void setMnickname(String mnickname) {
		this.mnickname = mnickname;
	}
	public String getGid() {
		return gid;
	}
	public void setGid(String gid) {
		this.gid = gid;
	}
	public Timestamp getRrdate() {
		return rrdate;
	}
	public void setRrdate(Timestamp rrdate) {
		this.rrdate = rrdate;
	}		
	
	public int getAllCount() {
		return allCount;
	}
	public void setAllCount(int allCount) {
		this.allCount = allCount;
	}
	public int getScore1() {
		return score1;
	}
	public void setScore1(int score1) {
		this.score1 = score1;
	}
	public int getScore2() {
		return score2;
	}
	public void setScore2(int score2) {
		this.score2 = score2;
	}
	public int getScore3() {
		return score3;
	}
	public void setScore3(int score3) {
		this.score3 = score3;
	}
	public int getScore4() {
		return score4;
	}
	public void setScore4(int score4) {
		this.score4 = score4;
	}
	public int getScore5() {
		return score5;
	}
	public void setScore5(int score5) {
		this.score5 = score5;
	}
	@Override
	public String toString() {
		return "ReviewDto [rscore=" + rscore + ", rtext=" + rtext + ", mid=" + mid + ", gid=" + gid + ", rrdate="
				+ rrdate + "]";
	}	
}
