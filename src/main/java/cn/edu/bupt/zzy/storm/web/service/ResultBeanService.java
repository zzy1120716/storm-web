package cn.edu.bupt.zzy.storm.web.service;

import cn.edu.bupt.zzy.storm.web.domain.ResultBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * @description: 业务逻辑层
 * @author: zzy
 * @date: 2019/5/19
 **/
@Service
public class ResultBeanService {

    @Autowired
    JdbcTemplate jdbcTemplate;

    public List<ResultBean> query() {

        String sql = "select longitude, latitude, count(1) as c from stat where time > unix_timestamp(date_sub(current_timestamp(), interval 10 minute)) * 1000 group by longitude, latitude";

        return (List<ResultBean>) jdbcTemplate.query(sql, new RowMapper<ResultBean>() {
            @Override
            public ResultBean mapRow(ResultSet resultSet, int i) throws SQLException {

                ResultBean bean = new ResultBean();

                bean.setLng(resultSet.getDouble("longitude"));
                bean.setLat(resultSet.getDouble("latitude"));
                bean.setCount(resultSet.getLong("c"));

                return bean;
            }
        });
    }


}
