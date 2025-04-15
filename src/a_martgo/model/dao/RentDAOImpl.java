package model.dao;

import common.utils.DbUtil;
import model.dto.RentHistoryDTO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RentDAOImpl implements RentDAO {
    public void getAllWarehouses() {
        String sql = "{CALL GetAllWarehouses()}";

        try (Connection conn = DbUtil.getConnection();
             CallableStatement stmt = conn.prepareCall(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("warehouse_id");
                String name = rs.getString("warehouse_name");
                String location = rs.getString("location");
                int height = rs.getInt("height");
                int width = rs.getInt("width");
                double far = rs.getDouble("FAR");
                System.out.printf("창고 ID: %d, 창고 이름: %s, 창고 위치: %s, 창고 높이: %d, 창고 면적: %d, 창고 용적률: %.2f%n",
                        id, name, location, height, width, far);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void getAllSectors(int warehouseId) {
        String sql = "{CALL GetAllSectors(?)}";

        try (Connection conn = DbUtil.getConnection();
             CallableStatement stmt = conn.prepareCall(sql);) {

            stmt.setInt(1, warehouseId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String sectorId = rs.getString("sector_id");
                int height = rs.getInt("height");
                int width = rs.getInt("width");
                double far = rs.getDouble("FAR");

                System.out.printf("섹터 ID: %s, 섹터 높이: %d, 섹터 면적: %d, 섹터 용적률: %.2f\n",
                        sectorId, height, width, far);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void getCostInfo(int warehouseId, String sectorId) {
        String sql = "{CALL GetCostInfoSector(?, ?)}";

        try (Connection conn = DbUtil.getConnection();
             CallableStatement stmt = conn.prepareCall(sql);) {

            stmt.setInt(1, warehouseId);
            stmt.setString(2, sectorId);

            try (ResultSet rs = stmt.executeQuery()) {
                System.out.println("\n=== 기간별 비용 정보 조회 ===");
                while (rs.next()) {
                    String period = rs.getString("period");
                    int price = rs.getInt("price");
                    System.out.printf("기간: %s, 가격: %d만원%n", period, price);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int getRentPrice(int wareHouse, String sectorName, int month) {
        String query = "{CALL GetCostInfo(?, ?, ?)}";
        int rentPrice = 0;

        try (Connection connection = DbUtil.getConnection();
             CallableStatement stmt = connection.prepareCall(query)) {

            stmt.setInt(1, wareHouse);
            stmt.setString(2, sectorName);
            stmt.setString(3, month + "개월");

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    rentPrice = rs.getInt("price");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rentPrice;
    }

    public void saveDb(RentHistoryDTO rentHistory) {
        String insertQuery = "{CALL InsertRentHistory(?, ?, ?, ?, ?, ?)}";

        try (Connection connection = DbUtil.getConnection();
             CallableStatement stmt = connection.prepareCall(insertQuery)) {

            stmt.setString(1, rentHistory.getSectorId());
            stmt.setInt(2, rentHistory.getWarehouseId());
            stmt.setDate(3, new java.sql.Date(rentHistory.getRentStartDate().getTime()));
            stmt.setDate(4, new java.sql.Date(rentHistory.getRentEndDate().getTime()));
            stmt.setInt(5, rentHistory.getRentPrice());
            stmt.setString(6, rentHistory.getUserId());

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void getHoldRentHistory() {
        String sql = "{CALL GetHoldRentHistory()}";

        try (Connection conn = DbUtil.getConnection();
             CallableStatement stmt = conn.prepareCall(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                int rentNum = rs.getInt("rent_num");
                String sectorId = rs.getString("sector_id");
                int warehouseId = rs.getInt("warehouse_id");
                String userId = rs.getString("user_id");
                Date rentStartDate = rs.getDate("rent_start_date");
                Date rentEndDate = rs.getDate("rent_end_date");
                int rentPrice = rs.getInt("rent_price");
                String status = rs.getString("status");

                System.out.println("임대번호: " + rentNum + ", 섹터: " + sectorId +
                        ", 창고: " + warehouseId + ", 회원ID: " + userId +
                        ", 임대 시작일: " + rentStartDate + ", 임대 종료일: " + rentEndDate +
                        ", 임대료: " + rentPrice + ", 상태: " + status);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateUserAdminId() {

        String sql = "{CALL updateUserAdminid()}";

        try (Connection conn = DbUtil.getConnection();
             CallableStatement stmt = conn.prepareCall(sql);) {
            stmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateAdminId(int rentNum, String adminId) {
        String sql = "{CALL UpdateAdminId(?, ?)}";


        try (Connection conn = DbUtil.getConnection();
             CallableStatement stmt = conn.prepareCall(sql);) {
            stmt.setInt(1, rentNum);
            stmt.setString(2, adminId);

            stmt.executeUpdate();

            System.out.println("임대 번호 " + rentNum + "의 상태가 '진행중'로 변경되었습니다.");

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void getInProgressRentHistory(String adminId) {
        String sql = "{CALL GetInProgressRentHistory(?)}";

        try (Connection conn = DbUtil.getConnection();
             CallableStatement stmt = conn.prepareCall(sql)) {

            stmt.setString(1, adminId);

            try (ResultSet rs = stmt.executeQuery()) {
                boolean dataFound = false;
                while (rs.next()) {
                    int rentNum = rs.getInt("rent_num");
                    String sectorId = rs.getString("sector_id");
                    int warehouseId = rs.getInt("warehouse_id");
                    String userId = rs.getString("user_id");
                    Date rentStartDate = rs.getDate("rent_start_date");
                    Date rentEndDate = rs.getDate("rent_end_date");
                    int rentPrice = rs.getInt("rent_price");
                    String status = rs.getString("status");

                    System.out.println("임대번호: " + rentNum + ", 섹터: " + sectorId +
                            ", 창고: " + warehouseId + ", 회원ID: " + userId +
                            ", 임대 시작일: " + rentStartDate + ", 임대 종료일: " + rentEndDate +
                            ", 임대료: " + rentPrice + ", 상태: " + status);

                    dataFound = true;
                }
                if (!dataFound) {
                    System.out.println("진행중인 임대 기록이 없습니다.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void completedRentStatus(int rentNum, String adminId) {
        String sql = "{CALL CompletedRentStatus(?, ?)}";

        try (Connection conn = DbUtil.getConnection();
             CallableStatement stmt = conn.prepareCall(sql)) {

            stmt.setInt(1, rentNum);
            stmt.setString(2, adminId);

            stmt.executeUpdate();  // 프로시저 실행
            System.out.println("임대 번호 " + rentNum + "의 상태가 '완료'로 변경되었습니다.");

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }


    public List<RentHistoryDTO> getMonthlyPerformance(String adminId) {
        List<RentHistoryDTO> list = new ArrayList<>();
        String sql = "{CALL GetMonthlyPerformance(?)}";

        try (Connection conn = DbUtil.getConnection();
             CallableStatement stmt = conn.prepareCall(sql)) {

            stmt.setString(1, adminId);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    int rentPrice = rs.getInt("rent_price");
                    Timestamp approveDate = rs.getTimestamp("approve_date");

                    list.add(new RentHistoryDTO(rentPrice, approveDate));
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}

