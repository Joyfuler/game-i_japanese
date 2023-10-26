package project.gamei.dto;

import java.sql.Timestamp;

public class FavoriteDto {
	private int fid;
	private Timestamp frdate;
	private String gid;
	private String mid;
	private String gname;
	private String gicon;
	private String ggenre;
	
	
	
	public FavoriteDto() {}
	public FavoriteDto(int fid, Timestamp frdate, String gid, String mid, String gname, String gicon, String ggenre) {
		super();
		this.fid = fid;
		this.frdate = frdate;
		this.gid = gid;
		this.mid = mid;
		this.gname = gname;
		this.gicon = gicon;
		this.ggenre = ggenre;
	}
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public Timestamp getFrdate() {
		return frdate;
	}
	public void setFrdate(Timestamp frdate) {
		this.frdate = frdate;
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
	
	public String getGgenre() {
		return ggenre;
	}
	public void setGgenre(String ggenre) {
		this.ggenre = ggenre;
	}
	@Override
	public String toString() {
		return "FavoriteDto [fid=" + fid + ", frdate=" + frdate + ", gid=" + gid + ", mid=" + mid + ", gname=" + gname
				+ ", gicon=" + gicon + "]";
	}			
}
