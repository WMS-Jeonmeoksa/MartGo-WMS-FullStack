package com.ssg.martgowmsfullstack.service;


import com.ssg.martgowmsfullstack.domain.RentHistoryVO;
import com.ssg.martgowmsfullstack.dto.CostInfoDTO;
import com.ssg.martgowmsfullstack.dto.RentHistoryDTO;
import com.ssg.martgowmsfullstack.dto.SectorDTO;
import com.ssg.martgowmsfullstack.dto.WarehouseDTO;
import com.ssg.martgowmsfullstack.mapper.RentMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;
import java.util.stream.Collectors;



@Service
@Log4j2
@RequiredArgsConstructor
@Transactional
public class RentServiceImpl implements RentService {

    @Autowired
    private final RentMapper rentMapper;

    @Autowired
    private final ModelMapper modelMapper;

    public List<WarehouseDTO> getAllWarehouses() {
        List<WarehouseDTO> warehouses = rentMapper.getAllWarehouses();
        warehouses.forEach(warehouse -> {
            warehouse.setStatus(getSectorStatus(warehouse.getWarehouseId()));
        });
        return warehouses;
    }

    public String getSectorStatus(int warehouseId) {
        List<String> sectorStatuses = rentMapper.getSectorStatus(warehouseId);
        boolean anyAvailable = sectorStatuses.stream()
                .anyMatch("사용가능"::equals);
        return anyAvailable ? "사용가능" : "사용불가";
    }

    public List<SectorDTO> getAllSector(int warehouseId) {
        List<SectorDTO> vo = rentMapper.getAllSectors(warehouseId);
        return vo.stream()
                .map(i -> modelMapper.map(i,SectorDTO.class))
                .collect(Collectors.toList());
    }

    public List<CostInfoDTO> getAllCostInfo(int wareHouseId, String sectorId) {
        List<CostInfoDTO> vo = rentMapper.getCostInfo(wareHouseId, sectorId);
        return vo.stream()
                .map(i -> modelMapper.map(i, CostInfoDTO.class))
                .collect(Collectors.toList());
    }


    public void saveRentHistory(RentHistoryDTO rentHistoryDTO) {
        RentHistoryVO rentHistoryVO = modelMapper.map(rentHistoryDTO, RentHistoryVO.class);
        rentMapper.saveDb(rentHistoryVO);
    }

    public List<RentHistoryDTO> holdRentList(String adminId) {
        List<RentHistoryDTO> vo = rentMapper.getHoldRentHistory(adminId);
        return vo.stream()
                .map(i -> modelMapper.map(i, RentHistoryDTO.class))
                .collect(Collectors.toList());
    }

    public List<RentHistoryDTO> inProgressRentList(String adminId) {
        List<RentHistoryDTO> vo = rentMapper.getInProgressRentHistory(adminId);
        return vo.stream()
                .map(i -> modelMapper.map(i, RentHistoryDTO.class))
                .collect(Collectors.toList());
    }

    public void approveRentHistory(int rentNum, String adminId) {
        rentMapper.updateAdminId(rentNum, adminId);
        rentMapper.updateUserAdminId(rentNum, adminId);

    }

    public void confirmRentHistory(int rentNum, String adminId) {
        rentMapper.completedRentStatus(rentNum, adminId);
    }

}
