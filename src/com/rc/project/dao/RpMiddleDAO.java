package com.rc.project.dao;

import com.rc.project.vo.RpMiddle;
import com.rc.project.vo.RpMiddleExample;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class RpMiddleDAO extends SqlMapClientDaoSupport {

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table RP_MIDDLE
     *
     * @ibatorgenerated Wed Mar 12 15:11:45 CST 2014
     */
    public RpMiddleDAO() {
        super();
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table RP_MIDDLE
     *
     * @ibatorgenerated Wed Mar 12 15:11:45 CST 2014
     */
    public int countByExample(RpMiddleExample example) {
        Integer count = (Integer)  getSqlMapClientTemplate().queryForObject("RP_MIDDLE_countByExample", example);
        return count.intValue();
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table RP_MIDDLE
     *
     * @ibatorgenerated Wed Mar 12 15:11:45 CST 2014
     */
    public int deleteByExample(RpMiddleExample example) {
        int rows = getSqlMapClientTemplate().delete("RP_MIDDLE_deleteByExample", example);
        return rows;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table RP_MIDDLE
     *
     * @ibatorgenerated Wed Mar 12 15:11:45 CST 2014
     */
    public int deleteByPrimaryKey(RpMiddle key) {
        int rows = getSqlMapClientTemplate().delete("RP_MIDDLE_deleteByPrimaryKey", key);
        return rows;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table RP_MIDDLE
     *
     * @ibatorgenerated Wed Mar 12 15:11:45 CST 2014
     */
    public void insert(RpMiddle record) {
        getSqlMapClientTemplate().insert("RP_MIDDLE_insert", record);
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table RP_MIDDLE
     *
     * @ibatorgenerated Wed Mar 12 15:11:45 CST 2014
     */
    public void insertSelective(RpMiddle record) {
        getSqlMapClientTemplate().insert("RP_MIDDLE_insertSelective", record);
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table RP_MIDDLE
     *
     * @ibatorgenerated Wed Mar 12 15:11:45 CST 2014
     */
    public List selectByExample(RpMiddleExample example) {
        List list = getSqlMapClientTemplate().queryForList("RP_MIDDLE_selectByExample", example);
        return list;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table RP_MIDDLE
     *
     * @ibatorgenerated Wed Mar 12 15:11:45 CST 2014
     */
    public RpMiddle selectByPrimaryKey(RpMiddle key) {
        RpMiddle record = (RpMiddle) getSqlMapClientTemplate().queryForObject("RP_MIDDLE_selectByPrimaryKey", key);
        return record;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table RP_MIDDLE
     *
     * @ibatorgenerated Wed Mar 12 15:11:45 CST 2014
     */
    public int updateByExampleSelective(RpMiddle record, RpMiddleExample example) {
        UpdateByExampleParms parms = new UpdateByExampleParms(record, example);
        int rows = getSqlMapClientTemplate().update("RP_MIDDLE_updateByExampleSelective", parms);
        return rows;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table RP_MIDDLE
     *
     * @ibatorgenerated Wed Mar 12 15:11:45 CST 2014
     */
    public int updateByExample(RpMiddle record, RpMiddleExample example) {
        UpdateByExampleParms parms = new UpdateByExampleParms(record, example);
        int rows = getSqlMapClientTemplate().update("RP_MIDDLE_updateByExample", parms);
        return rows;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table RP_MIDDLE
     *
     * @ibatorgenerated Wed Mar 12 15:11:45 CST 2014
     */
    public int updateByPrimaryKeySelective(RpMiddle record) {
        int rows = getSqlMapClientTemplate().update("RP_MIDDLE_updateByPrimaryKeySelective", record);
        return rows;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table RP_MIDDLE
     *
     * @ibatorgenerated Wed Mar 12 15:11:45 CST 2014
     */
    public int updateByPrimaryKey(RpMiddle record) {
        int rows = getSqlMapClientTemplate().update("RP_MIDDLE_updateByPrimaryKey", record);
        return rows;
    }

    /**
     * This class was generated by Apache iBATIS ibator.
     * This class corresponds to the database table RP_MIDDLE
     *
     * @ibatorgenerated Wed Mar 12 15:11:45 CST 2014
     */
    private static class UpdateByExampleParms extends RpMiddleExample {
        private Object record;

        public UpdateByExampleParms(Object record, RpMiddleExample example) {
            super(example);
            this.record = record;
        }

        public Object getRecord() {
            return record;
        }
    }
}