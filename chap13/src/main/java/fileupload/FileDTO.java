package fileupload;

public class FileDTO {
	public FileDTO() {}
	
	private String idx;
	private String title;
	private String category;
	private String orgFile;
	private String saveFile;
	private String reg_date;
	/**
	 * @return the idx
	 */
	public String getIdx() {
		return idx;
	}
	/**
	 * @param idx the idx to set
	 */
	public void setIdx(String idx) {
		this.idx = idx;
	}
	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * @return the category
	 */
	public String getCategory() {
		return category;
	}
	/**
	 * @param category the category to set
	 */
	public void setCategory(String category) {
		this.category = category;
	}
	/**
	 * @return the orgFile
	 */
	public String getOrgFile() {
		return orgFile;
	}
	/**
	 * @param orgFile the orgFile to set
	 */
	public void setOrgFile(String orgFile) {
		this.orgFile = orgFile;
	}
	/**
	 * @return the saveFile
	 */
	public String getSaveFile() {
		return saveFile;
	}
	/**
	 * @param saveFile the saveFile to set
	 */
	public void setSaveFile(String saveFile) {
		this.saveFile = saveFile;
	}
	/**
	 * @return the reg_date
	 */
	public String getReg_date() {
		return reg_date;
	}
	/**
	 * @param reg_date the reg_date to set
	 */
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
}
