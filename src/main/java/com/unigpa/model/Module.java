package com.unigpa.model;

public class Module {
    private int id;
    private String moduleCode;
    private String moduleName;
    private int credits;
    private String grade;
    private int semester;
    private int academicYear;
    private long degreeId;

    public Module() {
    }

    public Module(int id, String moduleCode, String moduleName, int credits, String grade, int semester,
            int academicYear) {
        this.id = id;
        this.moduleCode = moduleCode;
        this.moduleName = moduleName;
        this.credits = credits;
        this.grade = grade;
        this.semester = semester;
        this.academicYear = academicYear;
    }

    public Module(String moduleCode, String moduleName, int credits, String grade, int semester, int academicYear) {
        this.moduleCode = moduleCode;
        this.moduleName = moduleName;
        this.credits = credits;
        this.grade = grade;
        this.semester = semester;
        this.academicYear = academicYear;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getModuleCode() {
        return moduleCode;
    }

    public void setModuleCode(String moduleCode) {
        this.moduleCode = moduleCode;
    }

    public String getModuleName() {
        return moduleName;
    }

    public void setModuleName(String moduleName) {
        this.moduleName = moduleName;
    }

    public int getCredits() {
        return credits;
    }

    public void setCredits(int credits) {
        this.credits = credits;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public int getSemester() {
        return semester;
    }

    public void setSemester(int semester) {
        this.semester = semester;
    }

    public int getAcademicYear() {
        return academicYear;
    }

    public void setAcademicYear(int academicYear) {
        this.academicYear = academicYear;
    }

    public long getDegreeId() {
        return degreeId;
    }

    public void setDegreeId(long degreeId) {
        this.degreeId = degreeId;
    }
}
