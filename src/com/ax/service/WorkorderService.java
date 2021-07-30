package com.ax.service;

import com.ax.entity.Workorder;

import java.util.List;

/**
 * Created by Joe on 2021-07-30 0030
 */
public interface WorkorderService {
    List<Workorder> queryAllOrder(int projectId,int page,int limit);

    boolean addOrder(Workorder order);
}
