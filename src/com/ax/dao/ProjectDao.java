package com.ax.dao;

import com.ax.entity.Project;
import com.ax.entity.Workorder;

import java.util.List;

/**
 * Created by Joe on 2021-07-30 0030
 */
public interface ProjectDao {
    List<Project> queryAll();
}
