from asynckafka.includes cimport c_rd_kafka as crdk


cdef void cb_logger(
        const crdk.rd_kafka_t *rk,
        int level,
        const char *fac,
        const char *buf
)


cdef log_partition_list(
        crdk.rd_kafka_topic_partition_list_t *partitions
)


cdef void cb_rebalance(
        crdk.rd_kafka_t *rk,
        crdk.rd_kafka_resp_err_t err,
        crdk.rd_kafka_topic_partition_list_t *partitions, void *opaque
)


cdef class RdKafkaConsumer:
    cdef:
        crdk.rd_kafka_t *consumer
        crdk.rd_kafka_conf_t *conf
        crdk.rd_kafka_topic_conf_t *topic_conf
        crdk.rd_kafka_topic_partition_list_t *topic_partition_list
        char errstr[512]

        bytes brokers
        public list topics
        public dict consumer_settings
        public dict topic_settings
