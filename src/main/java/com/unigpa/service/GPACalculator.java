package com.unigpa.service;

import com.unigpa.model.Module;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class GPACalculator {

    private static final Map<String, Double> GRADE_POINTS = new HashMap<>();

    static {
        GRADE_POINTS.put("A+", 4.0);
        GRADE_POINTS.put("A", 4.0);
        GRADE_POINTS.put("A-", 3.7);
        GRADE_POINTS.put("B+", 3.3);
        GRADE_POINTS.put("B", 3.0);
        GRADE_POINTS.put("B-", 2.7);
        GRADE_POINTS.put("C+", 2.3);
        GRADE_POINTS.put("C", 2.0);
        GRADE_POINTS.put("C-", 1.7);
        GRADE_POINTS.put("D", 1.0);
        GRADE_POINTS.put("E", 0.0);
    }

    public static double calculateGPA(List<Module> modules) {
        if (modules == null || modules.isEmpty())
            return 0.0;

        double totalPoints = 0.0;
        int totalCredits = 0;

        for (Module m : modules) {
            Double gp = GRADE_POINTS.get(m.getGrade());
            if (gp != null) {
                totalPoints += (gp * m.getCredits());
                totalCredits += m.getCredits();
            }
        }

        return totalCredits == 0 ? 0.0 : totalPoints / totalCredits;
    }
}
