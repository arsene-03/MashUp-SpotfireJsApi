package com.pnd.mashup.model;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("Lib_items")
public class Lib_items {
	private String item_id;
	private String title;
	private String description;
	private String item_type;
	private String format_version;
	private String create_by;
	private Date created;
	private String modified_by;
	private Date modified;
	private Date accessed;
	private Integer content_size;
	private String parent_id;
	private String hidden;
	
	public String getItem_id() {
		return item_id;
	}
	public void setItem_id(String item_id) {
		this.item_id = item_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getItem_type() {
		return item_type;
	}
	public void setItem_type(String item_type) {
		this.item_type = item_type;
	}
	public String getFormat_version() {
		return format_version;
	}
	public void setFormat_version(String format_version) {
		this.format_version = format_version;
	}
	public String getCreate_by() {
		return create_by;
	}
	public void setCreate_by(String create_by) {
		this.create_by = create_by;
	}
	public Date getCreated() {
		return created;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
	public String getModified_by() {
		return modified_by;
	}
	public void setModified_by(String modified_by) {
		this.modified_by = modified_by;
	}
	public Date getModified() {
		return modified;
	}
	public void setModified(Date modified) {
		this.modified = modified;
	}
	public Date getAccessed() {
		return accessed;
	}
	public void setAccessed(Date accessed) {
		this.accessed = accessed;
	}
	public Integer getContent_size() {
		return content_size;
	}
	public void setContent_size(Integer content_size) {
		this.content_size = content_size;
	}
	public String getParent_id() {
		return parent_id;
	}
	public void setParent_id(String parent_id) {
		this.parent_id = parent_id;
	}
	public String getHidden() {
		return hidden;
	}
	public void setHidden(String hidden) {
		this.hidden = hidden;
	}
	
}
