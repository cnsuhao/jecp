package net.loyin.jfinal.plugin.sqlXml;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
@XmlRootElement
public class SqlGroupList {
	@XmlElement(name="sqlGroup")
	public List<SqlGroup> sqlGroupList=new ArrayList<SqlGroup>(); 
}
