package com.ax.entity;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Objects;

/**
 * Created by Joe on 2021-07-30 0030
 */
public class Workorder {
    private Long id;
    private String executor;
    private String description;
    private Long orderLevel;
    private LocalDate createDate;
    private Project project;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getExecutor() {
        return executor;
    }

    public void setExecutor(String executor) {
        this.executor = executor;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Long getOrderLevel() {
        return orderLevel;
    }

    public void setOrderLevel(Long orderLevel) {
        this.orderLevel = orderLevel;
    }

    public LocalDate getCreateDate() {
        return createDate;
    }

    public void setCreateDate(LocalDate createDate) {
        this.createDate = createDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Workorder workorder = (Workorder) o;
        return id == workorder.id &&
                orderLevel == workorder.orderLevel &&
                Objects.equals(executor, workorder.executor) &&
                Objects.equals(description, workorder.description) &&
                Objects.equals(createDate, workorder.createDate);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, executor, description, orderLevel, createDate);
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }
}
