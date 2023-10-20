package project.gamei.dto;

import java.sql.Timestamp;

public class MemberDto {
	private String mid;
	private String mnickname;
	private String mpw;
	private String memail;
	private String mphone;
	private String mphoto;
	private int mquest;
	private String manswer;
	private int mlevel;
	private Timestamp mrdate;
	
	public MemberDto() {}
	public MemberDto(String mid, String mnickname, String mpw, String memail, String mphone, String mphoto, int mquest,
			String manswer, int mlevel, Timestamp mrdate) {		
		this.mid = mid;
		this.mnickname = mnickname;
		this.mpw = mpw;
		this.memail = memail;
		this.mphone = mphone;
		this.mphoto = mphoto;
		this.mquest = mquest;
		this.manswer = manswer;
		this.mlevel = mlevel;
		this.mrdate = mrdate;
	}
	
	public MemberDto(String mid, String mnickname, String mpw, String memail, String mphone, String mphoto, int mquest,
			String manswer) {		
		this.mid = mid;
		this.mnickname = mnickname;
		this.mpw = mpw;
		this.memail = memail;
		this.mphone = mphone;
		this.mphoto = mphoto;
		this.mquest = mquest;
		this.manswer = manswer;		
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
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public String getMphone() {
		return mphone;
	}
	public void setMphone(String mphone) {
		this.mphone = mphone;
	}
	public String getMphoto() {
		return mphoto;
	}
	public void setMphoto(String mphoto) {
		this.mphoto = mphoto;
	}
	public int getMquest() {
		return mquest;
	}
	public void setMquest(int mquest) {
		this.mquest = mquest;
	}
	public String getManswer() {
		return manswer;
	}
	public void setManswer(String manswer) {
		this.manswer = manswer;
	}
	public int getMlevel() {
		return mlevel;
	}
	public void setMlevel(int mlevel) {
		this.mlevel = mlevel;
	}
	public Timestamp getMrdate() {
		return mrdate;
	}
	public void setMrdate(Timestamp mrdate) {
		this.mrdate = mrdate;
	}
	
	@Override
	public String toString() {
		return "MemberDto [mid=" + mid + ", mnickname=" + mnickname + ", mpw=" + mpw + ", memail=" + memail
				+ ", mphone=" + mphone + ", mphoto=" + mphoto + ", mquest=" + mquest + ", manswer=" + manswer
				+ ", mlevel=" + mlevel + "]";
	}	
	
}
