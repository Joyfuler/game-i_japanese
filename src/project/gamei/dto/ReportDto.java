package project.gamei.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class ReportDto {
	private int rno;
	private int rreason;
	private String mid;
	private String mnickname;
	private int bno;	
	private String gid;
	private String btitle;
	private String bcontent;
	private Date brdate;	
	private String reportermid;
	private Timestamp reportdate;
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getRreason() {
		return rreason;
	}
	public void setRreason(int rreason) {
		this.rreason = rreason;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public Date getBrdate() {
		return brdate;
	}
	public void setBrdate(Date brdate) {
		this.brdate = brdate;
	}
	public String getReportermid() {
		return reportermid;
	}
	public void setReportermid(String reportermid) {
		this.reportermid = reportermid;
	}
	
	public String getMnickname() {
		return mnickname;
	}
	public void setMnickname(String mnickname) {
		this.mnickname = mnickname;
	}
	public Timestamp getReportdate() {
		return reportdate;
	}
	public void setReportdate(Timestamp reportdate) {
		this.reportdate = reportdate;
	}	
	
	public String getGid() {
		return gid;
	}
	public void setGid(String gid) {
		this.gid = gid;
	}
	public ReportDto(int rno, int rreason, String mid, String mnickname, int bno, String btitle, String bcontent, Date brdate,
			String reportermid, Timestamp reportdate, String gid) {
		super();
		this.rno = rno;
		this.rreason = rreason;
		this.mid = mid;
		this.mnickname = mnickname;
		this.bno = bno;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.brdate = brdate;
		this.reportermid = reportermid;
		this.reportdate = reportdate;
		this.gid = gid;
		
	}
	@Override
	public String toString() {
		return "ReportDto [rno=" + rno + ", rreason=" + rreason + ", mid=" + mid + ", bno=" + bno + ", btitle=" + btitle
				+ ", bcontent=" + bcontent + ", brdate=" + brdate + ", reportermid=" + reportermid + "]";
	}		
}
