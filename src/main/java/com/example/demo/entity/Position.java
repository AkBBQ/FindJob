package com.example.demo.entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Position {
    private Integer positionId;

    private String positionName;

    private String positionAddr;

    private String positionRequest;

    private Integer companyId;

    private String positionDesc;

    private Integer categoryId;

    private String positionPrice;

    private String releaseDate;
}
