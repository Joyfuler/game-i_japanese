package project.gamei.dto;

public class ArticleDto {
	private int artid;
	private String img1;
	private String link1;
	
	public ArticleDto() {}

	public ArticleDto(int artid, String img1, String link1) {
		super();
		this.artid = artid;
		this.img1 = img1;
		this.link1 = link1;
	}

	public int getArtid() {
		return artid;
	}

	public void setArtid(int artid) {
		this.artid = artid;
	}

	public String getImg1() {
		return img1;
	}

	public void setImg1(String img1) {
		this.img1 = img1;
	}

	public String getLink1() {
		return link1;
	}

	public void setLink1(String link1) {
		this.link1 = link1;
	}

	@Override
	public String toString() {
		return "ArticleDto [artid=" + artid + ", img1=" + img1 + ", link1=" + link1 + "]";
	}		
}
