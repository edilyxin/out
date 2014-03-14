package com.rc.project.dao;

import com.rc.project.vo.RpFile;
import com.rc.project.vo.RpFileExample;
import java.math.BigDecimal;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class RpFileDAO extends SqlMapClientDaoSupport {

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table RP_FILE
     *
     * @ibatorgenerated Wed Mar 12 15:11:45 CST 2014
     */
    public RpFileDAO() {
        super();
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table RP_FILE
     *
     * @ibatorgenerated Wed Mar 12 15:11:45 CST 2014
     */
    public int countByExample(RpFileExample example) {
        Integer count = (Integer)  getSqlMapClientTemplate().queryForObject("RP_FILE_countByExample", example);
        return count.intValue();
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table RP_FILE
     *
     * @ibatorgenerated Wed Mar 12 15:11:45 CST 2014
     */
    public int deleteByExample(RpFileExample example) {
        int rows = getSqlMapClientTemplate().delete("RP_FILE_deleteByExample", example);
        return rows;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table RP_FILE
     *
     * @ibatorgenerated Wed Mar 12 15:11:45 CST 2014
     */
    public int deleteByPrimaryKey(BigDecimal rpfNid) {
        RpFile key = new RpFile();
        key.setRpfNid(rpfNid);
        int rows = getSqlMapClientTemplate().delete("RP_FILE_deleteByPrimaryKey", key);
        return rows;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table RP_FILE
     *
     * @ibatorgenerated Wed Mar 12 15:11:45 CST 2014
     */
    public void insert(RpFile record) {
        getSqlMapClientTemplate().insert("RP_FILE_insert", record);
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table RP_FILE
     *
     * @ibatorgenerated Wed Mar 12 15:11:45 CST 2014
     */
    public void insertSelective(RpFile record) {
        getSqlMapClientTemplate().insert("RP_FILE_insertSelective", record);
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table RP_FILE
     *
     * @ibatorgenerated Wed Mar 12 15:11:45 CST 2014
     */
    public List selectByExample(RpFileExample example) {
        List list = getSqlMapClientTemplate().queryForList("RP_FILE_selectByExample", example);
        return list;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table RP_FILE
     *
     * @ibatorgenerated Wed Mar 12 15:11:45 CST 2014
     */
    public RpFile selectByPrimaryKey(BigDecimal rpfNid) {
        RpFile key = new RpFile();
        key.setRpfNid(rpfNid);
        RpFile record = (RpFile) getSqlMapClientTemplate().queryForObject("RP_FILE_selectByPrimaryKey", key);
        return record;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table RP_FILE
     *
     * @ibatorgenerated Wed Mar 12 15:11:45 CST 2014
     */
    public int updateByExampleSelective(RpFile record, RpFileExample example) {
        UpdateByExampleParms parms = new UpdateByExampleParms(record, example);
        int rows = getSqlMapClientTemplate().update("RP_FILE_updateByExampleSelective", parms);
        return rows;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table RP_FILE
     *
     * @ibatorgenerated Wed Mar 12 15:11:45 CST 2014
     */
    public int updateByExample(RpFile record, RpFileExample example) {
        UpdateByExampleParms parms = new UpdateByExampleParms(record, example);
        int rows = getSqlMapClientTemplate().update("RP_FILE_updateByExample", parms);
        return rows;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table RP_FILE
     *
     * @ibatorgenerated Wed Mar 12 15:11:45 CST 2014
     */
    public int updateByPrimaryKeySelective(RpFile record) {
        int rows = getSqlMapClientTemplate().update("RP_FILE_updateByPrimaryKeySelective", record);
        return rows;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table RP_FILE
     *
     * @ibatorgenerated Wed Mar 12 15:11:45 CST 2014
     */
    public int updateByPrimaryKey(RpFile record) {
        int rows = getSqlMapClientTemplate().update("RP_FILE_updateByPrimaryKey", record);
        return rows;
    }

    /**
     * This class was generated by Apache iBATIS ibator.
     * This class corresponds to the database table RP_FILE
     *
     * @ibatorgenerated Wed Mar 12 15:11:45 CST 2014
     */
    private static class UpdateByExampleParms extends RpFileExample {
        private Object record;

        public UpdateByExampleParms(Object record, RpFileExample example) {
            super(example);
            this.record = record;
        }

        public Object getRecord() {
            return record;
        }
    }
}