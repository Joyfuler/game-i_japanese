package project.gamei.dto;

public class SearchWordDto {
	private int sid;
	private String sintro;
	private String sword;
	
	public SearchWordDto(int sid, String sintro, String sword) {
		super();
		this.sid = sid;
		this.sintro = sintro;
		this.sword = sword;
	}

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public String getSintro() {
		return sintro;
	}

	public void setSintro(String sintro) {
		this.sintro = sintro;
	}

	public String getSword() {
		return sword;
	}

	public void setSword(String sword) {
		this.sword = sword;
	}

	@Override
	public String toString() {
		return "SearchWordDto [sid=" + sid + ", sintro=" + sintro + ", sword=" + sword + "]";
	}
	
}
