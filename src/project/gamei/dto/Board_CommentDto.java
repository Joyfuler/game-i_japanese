package project.gamei.dto;

import java.sql.Timestamp;

public class Board_CommentDto {
	private int bcno;
	private String bctext;
	private String bcip;
	private int bcgroup;
	private int bcstep;
	private int bcindent;
	private Timestamp bcrdate;
	private int bno;	
	private String mid;
	private int mlevel;
	private String mnickname;
	private String mphoto;
	private String memail;
	
	public Board_CommentDto(int bcno, String bctext, String bcip, int bcgroup, int bcstep, int bcindent,
			Timestamp bcrdate, int bno, String mid, int mlevel, String mnickname) {		
		this.bcno = bcno;
		this.bctext = bctext;
		this.bcip = bcip;
		this.bcgroup = bcgroup;
		this.bcstep = bcstep;
		this.bcindent = bcindent;
		this.bcrdate = bcrdate;
		this.bno = bno;
		this.mid = mid;
		this.mlevel = mlevel;
		this.mnickname = mnickname;
	}
	
	public Board_CommentDto(String mnickname, String mphoto, int mlevel, String memail, int bcno, String bctext,
			String bcip, int bcgroup, int bcstep, int bcindent, int bno, String mid, Timestamp bcrdate) {		
		this.mnickname = mnickname;
		this.mphoto = mphoto;
		this.mlevel = mlevel;
		this.memail = memail;
		this.bcno = bcno;
		this.bctext = bctext;
		this.bcip = bcip;
		this.bcgroup = bcgroup;
		this.bcstep = bcstep;
		this.bcindent = bcindent;
		this.bno = bno;
		this.mid = mid;
		this.bcrdate = bcrdate;		
	}	
	
	public Board_CommentDto(String mid, String bctext, String bcip) {		
		this.mid = mid;
		this.bctext = bctext;
		this.bcip = bcip;
	}	
	
	public Board_CommentDto(String bctext, String bcip, int bcgroup, int bcstep, int bcindent,
			String mid) {			
		this.bctext = bctext;
		this.bcip = bcip;
		this.bcgroup = bcgroup;
		this.bcstep = bcstep;
		this.bcindent = bcindent;
		this.mid = mid;
	}
	
	
	
	public int getBcno() {
		return bcno;
	}
	public void setBcno(int bcno) {
		this.bcno = bcno;
	}
	public String getBctext() {
		return bctext;
	}
	public void setBctext(String bctext) {
		this.bctext = bctext;
	}
	public String getBcip() {
		return bcip;
	}
	public void setBcip(String bcip) {
		this.bcip = bcip;
	}
	public int getBcgroup() {
		return bcgroup;
	}
	public void setBcgroup(int bcgroup) {
		this.bcgroup = bcgroup;
	}
	public int getBcstep() {
		return bcstep;
	}
	public void setBcstep(int bcstep) {
		this.bcstep = bcstep;
	}
	public int getBcindent() {
		return bcindent;
	}
	public void setBcindent(int bcindent) {
		this.bcindent = bcindent;
	}
	public Timestamp getBcrdate() {
		return bcrdate;
	}
	public void setBcrdate(Timestamp bcrdate) {
		this.bcrdate = bcrdate;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMnickname() {
		return mnickname;
	}
	public void setMnickname(String mnickname) {
		this.mnickname = mnickname;
	}
	
	public int getMlevel() {
		return mlevel;
	}
	public void setMlevel(int mlevel) {
		this.mlevel = mlevel;
	}
	
	public String getMphoto() {
		return mphoto;
	}

	public void setMphoto(String mphoto) {
		this.mphoto = mphoto;
	}

	public String getMemail() {
		return memail;
	}

	public void setMemail(String memail) {
		this.memail = memail;
	}

	@Override
	public String toString() {
		return "Board_CommentDto [bcno=" + bcno + ", bctext=" + bctext + ", bcip=" + bcip + ", bcgroup=" + bcgroup
				+ ", bcstep=" + bcstep + ", bcindent=" + bcindent + ", bcrdate=" + bcrdate + ", bno=" + bno + ", mid="
				+ mid + ", mnickname=" + mnickname + "]";
	}	
}
