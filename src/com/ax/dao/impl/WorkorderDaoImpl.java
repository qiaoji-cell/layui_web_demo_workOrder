package com.ax.dao.impl;

import com.ax.dao.WorkorderDao;
import com.ax.entity.Project;
import com.ax.entity.Workorder;
import com.ax.utils.BaseDao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Joe on 2021-07-30 0030
 */
public class WorkorderDaoImpl extends BaseDao implements WorkorderDao {

    @Override
    public List<Workorder> queryAll(int projectId,int page,int limit) {
        String sql = "select w.id,projectName,Executor,description,orderLevel,createDate from" +
                " workorder w left join project p on w.projectid = p.id where 1=1 " ;
        if(projectId > 0){
            sql += " and projectId = "+projectId;
        }
        if(limit > 0 && page>0){
            sql +=" limit "+(page-1)*limit+","+limit;
        }
        List<Workorder> workorders = new ArrayList<>();
        ResultSet rs = this.query(sql);
        try {
            while(rs.next()){
                Workorder w = new Workorder();
                w.setId(rs.getLong("w.id"));
                w.setCreateDate(rs.getDate("createDate").toLocalDate());
                w.setDescription(rs.getString("description"));
                w.setExecutor(rs.getString("Executor"));
                w.setOrderLevel(rs.getLong("orderLevel"));
                Project p = new Project();
                p.setProjectName(rs.getString("projectName"));
                w.setProject(p);
                workorders.add(w);
            }
            closeAll(conn,pstmt,rs);
            return workorders;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    @Override
    public int addOrder(Workorder w) {
        String sql = "insert into workorder(projectId,Executor,description,orderLevel) values(?,?,?,?)";
        return this.update(sql,w.getProject().getId(),w.getExecutor(),w.getDescription(),w.getOrderLevel());
    }
}
