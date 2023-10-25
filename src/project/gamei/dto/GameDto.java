package project.gamei.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class GameDto {
	private String gid;
	private String gname;
	private String ggenre;
	private String gpub;
	private Date gpdate;
	private String gicon;
	private String gdesc;
	private int ghit;
	private int rid;
	private double rscore;
	private String rtext;
	private String mid;
	private int gviewCount;
	private double avg;
	private Timestamp maxdate;
	

	public GameDto() {
	}
	
	public GameDto(String gid, String gname, String gicon, String gpub, Timestamp maxdate) {		
		this.gid = gid;
		this.gname = gname;
		this.gicon = gicon;
		this.gpub = gpub;
		this.maxdate = maxdate;
	}
	

	public GameDto(String gid, String gname, String ggenre, String gpub, Date gpdate, String gicon, String gdesc,
			int ghit) {
		super();
		this.gid = gid;
		this.gname = gname;
		this.ggenre = ggenre;
		this.gpub = gpub;
		this.gpdate = gpdate;
		this.gicon = gicon;
		this.gdesc = gdesc;
		this.ghit = ghit;
	}
	
	public GameDto(String gid, String gname, String ggenre, String gpub, Date gpdate, String gicon, String gdesc) {		
		this.gid = gid;
		this.gname = gname;
		this.ggenre = ggenre;
		this.gpub = gpub;
		this.gpdate = gpdate;
		this.gicon = gicon;
		this.gdesc = gdesc;		
	}

	public GameDto(String gid, String gname, String ggenre, String gpub, Date gpdate, String gicon, String gdesc,
			int ghit, int rid, double rscore, String rtext, String mid) {
		super();
		this.gid = gid;
		this.gname = gname;
		this.ggenre = ggenre;
		this.gpub = gpub;
		this.gpdate = gpdate;
		this.gicon = gicon;
		this.gdesc = gdesc;
		this.ghit = ghit;
		this.rid = rid;
		this.rscore = rscore;
		this.rtext = rtext;
		this.mid = mid;
	}
	
	public GameDto(String gid, String gname, String ggenre, String gpub, Date gpdate, String gicon, String gdesc, int gviewCount,
			int ghit, double avg) {		
		this.gid = gid;
		this.gname = gname;
		this.ggenre = ggenre;
		this.gpub = gpub;
		this.gpdate = gpdate;
		this.gicon = gicon;
		this.gdesc = gdesc;
		this.gviewCount = gviewCount;
		this.ghit = ghit;
		this.avg = avg;		
	}
	
	public GameDto(String gid, String gname, String ggenre, String gpub, Date gpdate, String gicon, String gdesc,
			int ghit, double avg) {		
		this.gid = gid;
		this.gname = gname;
		this.ggenre = ggenre;
		this.gpub = gpub;
		this.gpdate = gpdate;
		this.gicon = gicon;
		this.gdesc = gdesc;		
		this.ghit = ghit;
		this.avg = avg;		
	}
	
	
	public GameDto(String gid, String gname, String ggenre, String gpub, Date gpdate, String gicon, String gdesc,
			int ghit, int gviewCount) {		
		this.gid = gid;
		this.gname = gname;
		this.ggenre = ggenre;
		this.gpub = gpub;
		this.gpdate = gpdate;
		this.gicon = gicon;
		this.gdesc = gdesc;
		this.ghit = ghit;
		this.gviewCount = gviewCount;		
	}
	

	public String getGid() {
		return gid;
	}

	public void setGid(String gid) {
		this.gid = gid;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public String getGgenre() {
		return ggenre;
	}

	public void setGgenre(String ggenre) {
		this.ggenre = ggenre;
	}

	public String getGpub() {
		return gpub;
	}

	public void setGpub(String gpub) {
		this.gpub = gpub;
	}

	public Date getGpdate() {
		return gpdate;
	}

	public void setGpdate(Date gpdate) {
		this.gpdate = gpdate;
	}

	public String getGicon() {
		return gicon;
	}

	public void setGicon(String gicon) {
		this.gicon = gicon;
	}

	public String getGdesc() {
		return gdesc;
	}

	public void setGdesc(String gdesc) {
		this.gdesc = gdesc;
	}

	public int getGhit() {
		return ghit;
	}

	public void setGhit(int ghit) {
		this.ghit = ghit;
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public double getRscore() {
		return rscore;
	}

	public void setRscore(double rscore) {
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
		
	public double getAvg() {
		return avg;
	}

	public void setAvg(double avg) {
		this.avg = avg;
	}	

	public int getGviewCount() {
		return gviewCount;
	}

	public void setGviewCount(int gviewCount) {
		this.gviewCount = gviewCount;
	}
	
	public Timestamp getMaxdate() {
		return maxdate;
	}

	public void setMaxdate(Timestamp maxdate) {
		this.maxdate = maxdate;
	}

	@Override
	public String toString() {
		return "GameDto [gid=" + gid + ", gname=" + gname + ", ggenre=" + ggenre + ", gpub=" + gpub + ", gpdate="
				+ gpdate + ", gicon=" + gicon + ", gdesc=" + gdesc + ", ghit=" + ghit + ", rid=" + rid + ", rscore="
				+ rscore + ", rtext=" + rtext + ", mid=" + mid + ", gviewCount=" + gviewCount + ", avg=" + avg + "]";
	}	
}
