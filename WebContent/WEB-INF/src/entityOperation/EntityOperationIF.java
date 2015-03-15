/*
 * 创建日期 2005-7-22
 *
 * 注释
 */
package entityOperation;

import net.sf.hibernate.HibernateException;

/**
 * @author Jeremy
 * 
 * 数据实体操作接口
 */

public interface EntityOperationIF {

	/**
	 * 执行数据插入操作
	 * 
	 * @param dataObject  待插入的数据对象
	 * @return 结果成败标记
	 */
	boolean insert(Object dataObject) throws HibernateException;

	/**
	 * 执行数据更新操作
	 * 
	 * @param dataObject 待更新的数据对象
	 * @return 结果成败标记
	 */
	boolean update(Object dataObject) throws HibernateException;

	/**
	 * 
	 * @param dataObject
	 * @return
	 * @throws HibernateException
	 */
	boolean del(Object dataObject) throws HibernateException;
	
	/**
	 * 根据对象ID执行数据删除操作
	 * 
	 * @param id 要删除对象的ID
	 * @return 结果成败标记
	 */
	boolean delById(String id) throws HibernateException;

	/**
	 * 根据对象ID执行查询操作
	 * 
	 * @param id  待查询对象的ID
	 * @return 对象集合，如果不存在返回一个空集合，但不允许返回 null
	 */
	Object queryById(String id) throws HibernateException;

	/**
	 * 查询全部对象
	 * 
	 * @return 对象集合，如果不存在返回一个空集合，但不允许返回 null
	 */
	java.util.List queryAll() throws HibernateException;

}
