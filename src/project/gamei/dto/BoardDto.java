package project.gamei.dto;

import java.sql.Timestamp;

public class BoardDto {	
	private int bno;
	private String btitle;
	private String bcontent;
	private Timestamp brdate;
	private String bimg;
	private String bip;
	private int bgroup;
	private int bstep;
	private int bindent;
	private int bhit;	
	private String mid;
	private String mphoto;
	private String mnickname;
	private int mlevel;
	private String memail;
	private String gid;
	private String gname;
	private String gicon;
	
	public BoardDto() {}
	
	public BoardDto(int bno, String btitle, String bcontent, Timestamp brdate, String bimg, String bip, int bgroup,
			int bstep, int bindent, int bhit, String gid, String mid, String mphoto, String mnickname) {
		super();
		this.bno = bno;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.brdate = brdate;
		this.bimg = bimg;
		this.bip = bip;
		this.bgroup = bgroup;
		this.bstep = bstep;
		this.bindent = bindent;
		this.bhit = bhit;
		this.gid = gid;
		this.mid = mid;
		this.mphoto = mphoto;
		this.mnickname = mnickname;
	}
	
	public BoardDto(int bno, String btitle, String bcontent, String bimg, String bip, String gid, String mid) {
		this.bno = bno;
		this.btitle = btitle;
		this.bcontent = bcontent;		
		this.bimg = bimg;
		this.bip = bip;		
	}
	
	
	public BoardDto(int bno, String btitle, String bcontent, Timestamp brdate, String bimg, String bip, int bgroup,
			int bstep, int bindent, int bhit, String gid, String mid, String mphoto, String mnickname, int mlevel,
			String memail) {		
		this.bno = bno;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.brdate = brdate;
		this.bimg = bimg;
		this.bip = bip;
		this.bgroup = bgroup;
		this.bstep = bstep;
		this.bindent = bindent;
		this.bhit = bhit;
		this.gid = gid;
		this.mid = mid;
		this.mphoto = mphoto;
		this.mnickname = mnickname;
		this.mlevel = mlevel;
		this.memail = memail;
	}
	
	public BoardDto(String gname, String gicon, int bno, String btitle, String bcontent, Timestamp brdate, String bimg, String bip, int bgroup,
			int bstep, int bindent, int bhit, String gid, String mid, String mphoto, String mnickname, int mlevel,
			String memail) {
		this.gname = gname;
		this.gicon = gicon;
		this.bno = bno;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.brdate = brdate;
		this.bimg = bimg;
		this.bip = bip;
		this.bgroup = bgroup;
		this.bstep = bstep;
		this.bindent = bindent;
		this.bhit = bhit;
		this.gid = gid;
		this.mid = mid;
		this.mphoto = mphoto;
		this.mnickname = mnickname;
		this.mlevel = mlevel;
		this.memail = memail;
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
	public Timestamp getBrdate() {
		return brdate;
	}
	public void setBrdate(Timestamp brdate) {
		this.brdate = brdate;
	}
	public String getBimg() {
		return bimg;
	}
	public void setBimg(String bimg) {
		this.bimg = bimg;
	}
	public String getBip() {
		return bip;
	}
	public void setBip(String bip) {
		this.bip = bip;
	}
	public int getBgroup() {
		return bgroup;
	}
	public void setBgroup(int bgroup) {
		this.bgroup = bgroup;
	}
	public int getBstep() {
		return bstep;
	}
	public void setBstep(int bstep) {
		this.bstep = bstep;
	}
	public int getBindent() {
		return bindent;
	}
	public void setBindent(int bindent) {
		this.bindent = bindent;
	}
	public int getBhit() {
		return bhit;
	}
	public void setBhit(int bhit) {
		this.bhit = bhit;
	}
	public String getGid() {
		return gid;
	}
	public void setGid(String gid) {
		this.gid = gid;
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
	
	public int getMlevel() {
		return mlevel;
	}

	public void setMlevel(int mlevel) {
		this.mlevel = mlevel;
	}

	public String getMemail() {
		return memail;
	}

	public void setMemail(String memail) {
		this.memail = memail;
	}	

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public String getGicon() {
		return gicon;
	}

	public void setGicon(String gicon) {
		this.gicon = gicon;
	}

	@Override
	public String toString() {
		return "BoardDto [bno=" + bno + ", btitle=" + btitle + ", bcontent=" + bcontent + ", brdate=" + brdate
				+ ", bimg=" + bimg + ", bip=" + bip + ", bgroup=" + bgroup + ", bstep=" + bstep + ", bindent=" + bindent
				+ ", bhit=" + bhit + ", gid=" + gid + ", mid=" + mid + ", mphoto=" + mphoto + ", mnickname=" + mnickname
				+ "]";
	}	
}
