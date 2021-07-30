package com.ax.dao.impl;

import com.ax.dao.ProjectDao;
import com.ax.entity.Project;
import com.ax.utils.BaseDao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Joe on 2021-07-30 0030
 */
public class ProjectDaoImpl extends BaseDao implements ProjectDao {
    @Override
    public List<Project> queryAll() {
        String sql = "select id,projectName from project";
        List<Project> projects = new ArrayList<>();
        ResultSet rs = this.query(sql);
        try {
            while(rs.next()){
                Project p = new Project();
                p.setId(rs.getLong("id"));
                p.setProjectName(rs.getString("projectName"));
                projects.add(p);
            }
            closeAll(conn,pstmt,rs);
            return projects;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
}
