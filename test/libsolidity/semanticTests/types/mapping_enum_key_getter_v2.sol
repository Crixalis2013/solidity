pragma experimental ABIEncoderV2;
contract test {
    enum E { A, B, C }
    mapping(E => uint8) public table;
    function set(E k, uint8 v) public {
        table[k] = v;
    }
    function get(E k) public returns (uint8) {
        return this.table(k);
    }
}
// ====
// compileViaYul: also
// ----
// table(uint8): 0 -> 0
// table(uint8): 0x01 -> 0
// table(uint8): 0xa7 -> FAILURE
// get(uint8): 0 -> 0
// get(uint8): 0x01 -> 0
// get(uint8): 0xa7 -> FAILURE
// set(uint8,uint8): 0x01, 0xa1 ->
// table(uint8): 0 -> 0
// table(uint8): 0x01 -> 0xa1
// table(uint8): 0xa7 -> FAILURE
// get(uint8): 0 -> 0
// get(uint8): 0x01 -> 0xa1
// get(uint8): 0xa7 -> FAILURE
// set(uint8,uint8): 0x00, 0xef ->
// table(uint8): 0 -> 0xef
// table(uint8): 0x01 -> 0xa1
// table(uint8): 0xa7 -> FAILURE
// get(uint8): 0 -> 0xef
// get(uint8): 0x01 -> 0xa1
// get(uint8): 0xa7 -> FAILURE
// set(uint8,uint8): 0x01, 0x05 ->
// table(uint8): 0 -> 0xef
// table(uint8): 0x01 -> 0x05
// table(uint8): 0xa7 -> FAILURE
// get(uint8): 0 -> 0xef
// get(uint8): 0x01 -> 0x05
// get(uint8): 0xa7 -> FAILURE
