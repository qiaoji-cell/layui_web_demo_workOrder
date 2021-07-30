package com.ax.service.impl;

import com.ax.dao.ProjectDao;
import com.ax.dao.impl.ProjectDaoImpl;
import com.ax.entity.Project;
import com.ax.service.ProjectService;

import java.util.List;

/**
 * Created by Joe on 2021-07-30 0030
 */
public class ProjectServiceImpl implements ProjectService {
    ProjectDao projectDao = new ProjectDaoImpl();
    @Override
    public List<Project> queryAllProject() {
        return projectDao.queryAll();
    }
}
