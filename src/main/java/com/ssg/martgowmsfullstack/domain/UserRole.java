package com.ssg.martgowmsfullstack.domain;

public enum UserRole {
    USER("회원"),
    CUSTOMER("거래처"),
    ADMIN("창고관리자"),
    SUPERADMIN("총관리자");

    private final String label;

    UserRole(String label) {
        this.label = label;
    }

    public String getLabel() {
        return label;
    }

    // 한글 → Enum 매핑용
    public static UserRole fromLabel(String label) {
        for (UserRole role : UserRole.values()) {
            if (role.label.equals(label)) {
                return role;
            }
        }
        throw new IllegalArgumentException("권한이 올바르지 않습니다: " + label);
    }
}
