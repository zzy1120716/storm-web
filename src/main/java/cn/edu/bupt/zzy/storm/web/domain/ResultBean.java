package cn.edu.bupt.zzy.storm.web.domain;

import org.springframework.stereotype.Component;

/**
 * @description: 结果实体类
 * @author: zzy
 * @date: 2019/5/19
 **/
@Component
public class ResultBean {

    private double lng;

    private double lat;

    private long count;

    public double getLng() {
        return lng;
    }

    public void setLng(double lng) {
        this.lng = lng;
    }

    public double getLat() {
        return lat;
    }

    public void setLat(double lat) {
        this.lat = lat;
    }

    public long getCount() {
        return count;
    }

    public void setCount(long count) {
        this.count = count;
    }
}
