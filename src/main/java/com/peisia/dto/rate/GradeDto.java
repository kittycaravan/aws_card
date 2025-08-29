package com.peisia.dto.rate;

import lombok.Data;

@Data
public class GradeDto {
    private String grade;
    private int chance;

    public GradeDto() {}

    public GradeDto(String grade, int chance) {
        this.grade = grade;
        this.chance = chance;
    }
}