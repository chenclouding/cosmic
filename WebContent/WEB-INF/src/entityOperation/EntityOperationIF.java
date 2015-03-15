/*
 * �������� 2005-7-22
 *
 * ע��
 */
package entityOperation;

import net.sf.hibernate.HibernateException;

/**
 * @author Jeremy
 * 
 * ����ʵ������ӿ�
 */

public interface EntityOperationIF {

	/**
	 * ִ�����ݲ������
	 * 
	 * @param dataObject  ����������ݶ���
	 * @return ����ɰܱ��
	 */
	boolean insert(Object dataObject) throws HibernateException;

	/**
	 * ִ�����ݸ��²���
	 * 
	 * @param dataObject �����µ����ݶ���
	 * @return ����ɰܱ��
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
	 * ���ݶ���IDִ������ɾ������
	 * 
	 * @param id Ҫɾ�������ID
	 * @return ����ɰܱ��
	 */
	boolean delById(String id) throws HibernateException;

	/**
	 * ���ݶ���IDִ�в�ѯ����
	 * 
	 * @param id  ����ѯ�����ID
	 * @return ���󼯺ϣ���������ڷ���һ���ռ��ϣ����������� null
	 */
	Object queryById(String id) throws HibernateException;

	/**
	 * ��ѯȫ������
	 * 
	 * @return ���󼯺ϣ���������ڷ���һ���ռ��ϣ����������� null
	 */
	java.util.List queryAll() throws HibernateException;

}
