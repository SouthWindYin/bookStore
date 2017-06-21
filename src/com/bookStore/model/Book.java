package com.bookStore.model;

import java.util.Date;

public class Book {
    private Integer id;

    private Integer bookInfoId;

    private Date createDate;

    private Integer borrowerId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getBookInfoId() {
        return bookInfoId;
    }

    public void setBookInfoId(Integer bookInfoId) {
        this.bookInfoId = bookInfoId;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Integer getBorrowerId() {
        return borrowerId;
    }

    public void setBorrowerId(Integer borrowerId) {
        this.borrowerId = borrowerId;
    }
}