package com.example.demo.entity;


import lombok.Data;

@Data
public class Deliver {
    private int deliverId;

    private int userId;

    private int positionId;

    private int companyId;

    private int resumeId;

    private int state;

    private String deliverTime;
}
