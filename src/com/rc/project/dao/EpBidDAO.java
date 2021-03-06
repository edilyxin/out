package com.rc.project.dao;

import com.rc.project.vo.EpBid;
import com.rc.project.vo.EpBidExample;
import java.math.BigDecimal;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class EpBidDAO extends SqlMapClientDaoSupport {

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table EP_BID
     *
     * @ibatorgenerated Wed Mar 12 15:11:45 CST 2014
     */
    public EpBidDAO() {
        super();
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table EP_BID
     *
     * @ibatorgenerated Wed Mar 12 15:11:45 CST 2014
     */
    public int countByExample(EpBidExample example) {
        Integer count = (Integer)  getSqlMapClientTemplate().queryForObject("EP_BID_countByExample", example);
        return count.intValue();
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table EP_BID
     *
     * @ibatorgenerated Wed Mar 12 15:11:45 CST 2014
     */
    public int deleteByExample(EpBidExample example) {
        int rows = getSqlMapClientTemplate().delete("EP_BID_deleteByExample", example);
        return rows;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table EP_BID
     *
     * @ibatorgenerated Wed Mar 12 15:11:45 CST 2014
     */
    public int deleteByPrimaryKey(BigDecimal ebNid) {
        EpBid key = new EpBid();
        key.setEbNid(ebNid);
        int rows = getSqlMapClientTemplate().delete("EP_BID_deleteByPrimaryKey", key);
        return rows;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table EP_BID
     *
     * @ibatorgenerated Wed Mar 12 15:11:45 CST 2014
     */
    public void insert(EpBid record) {
        getSqlMapClientTemplate().insert("EP_BID_insert", record);
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table EP_BID
     *
     * @ibatorgenerated Wed Mar 12 15:11:45 CST 2014
     */
    public void insertSelective(EpBid record) {
        getSqlMapClientTemplate().insert("EP_BID_insertSelective", record);
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table EP_BID
     *
     * @ibatorgenerated Wed Mar 12 15:11:45 CST 2014
     */
    public List selectByExample(EpBidExample example) {
        List list = getSqlMapClientTemplate().queryForList("EP_BID_selectByExample", example);
        return list;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table EP_BID
     *
     * @ibatorgenerated Wed Mar 12 15:11:45 CST 2014
     */
    public EpBid selectByPrimaryKey(BigDecimal ebNid) {
        EpBid key = new EpBid();
        key.setEbNid(ebNid);
        EpBid record = (EpBid) getSqlMapClientTemplate().queryForObject("EP_BID_selectByPrimaryKey", key);
        return record;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table EP_BID
     *
     * @ibatorgenerated Wed Mar 12 15:11:45 CST 2014
     */
    public int updateByExampleSelective(EpBid record, EpBidExample example) {
        UpdateByExampleParms parms = new UpdateByExampleParms(record, example);
        int rows = getSqlMapClientTemplate().update("EP_BID_updateByExampleSelective", parms);
        return rows;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table EP_BID
     *
     * @ibatorgenerated Wed Mar 12 15:11:45 CST 2014
     */
    public int updateByExample(EpBid record, EpBidExample example) {
        UpdateByExampleParms parms = new UpdateByExampleParms(record, example);
        int rows = getSqlMapClientTemplate().update("EP_BID_updateByExample", parms);
        return rows;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table EP_BID
     *
     * @ibatorgenerated Wed Mar 12 15:11:45 CST 2014
     */
    public int updateByPrimaryKeySelective(EpBid record) {
        int rows = getSqlMapClientTemplate().update("EP_BID_updateByPrimaryKeySelective", record);
        return rows;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table EP_BID
     *
     * @ibatorgenerated Wed Mar 12 15:11:45 CST 2014
     */
    public int updateByPrimaryKey(EpBid record) {
        int rows = getSqlMapClientTemplate().update("EP_BID_updateByPrimaryKey", record);
        return rows;
    }

    /**
     * This class was generated by Apache iBATIS ibator.
     * This class corresponds to the database table EP_BID
     *
     * @ibatorgenerated Wed Mar 12 15:11:45 CST 2014
     */
    private static class UpdateByExampleParms extends EpBidExample {
        private Object record;

        public UpdateByExampleParms(Object record, EpBidExample example) {
            super(example);
            this.record = record;
        }

        public Object getRecord() {
            return record;
        }
    }
}