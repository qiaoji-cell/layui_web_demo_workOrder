package com.ax.service.impl;

import com.ax.dao.WorkorderDao;
import com.ax.dao.impl.WorkorderDaoImpl;
import com.ax.entity.Workorder;
import com.ax.service.WorkorderService;

import java.util.List;

/**
 * Created by Joe on 2021-07-30 0030
 */
public class WorkorderServiceImpl implements WorkorderService {
    WorkorderDao workorderDao = new WorkorderDaoImpl();
    @Override
    public List<Workorder> queryAllOrder(int projectId,int page,int limit) {
        return workorderDao.queryAll(projectId,page,limit);
    }

    @Override
    public boolean addOrder(Workorder order) {
        return workorderDao.addOrder(order)>0?true:false;
    }
}
