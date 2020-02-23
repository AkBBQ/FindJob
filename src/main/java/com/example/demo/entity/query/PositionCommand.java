package com.example.demo.entity.query;

import lombok.Data;
import java.util.List;

/**
 * 职位搜索Command
 * @author xxx
 */

@Data
public class PositionCommand {
    /**
     * 职位id
     */
    private List<Integer> positionId;
}