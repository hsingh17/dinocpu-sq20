;buildInfoPackage: chisel3, version: 3.2.4, scalaVersion: 2.12.10, sbtVersion: 1.3.2
circuit LocalPredictor : 
  module LocalPredictor : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip pc : UInt<32>, flip update : UInt<1>, flip taken : UInt<1>, prediction : UInt<1>}
    
    wire _T : UInt<3>[32] @[branchpred.scala 37:40]
    _T[0] <= UInt<3>("h04") @[branchpred.scala 37:40]
    _T[1] <= UInt<3>("h04") @[branchpred.scala 37:40]
    _T[2] <= UInt<3>("h04") @[branchpred.scala 37:40]
    _T[3] <= UInt<3>("h04") @[branchpred.scala 37:40]
    _T[4] <= UInt<3>("h04") @[branchpred.scala 37:40]
    _T[5] <= UInt<3>("h04") @[branchpred.scala 37:40]
    _T[6] <= UInt<3>("h04") @[branchpred.scala 37:40]
    _T[7] <= UInt<3>("h04") @[branchpred.scala 37:40]
    _T[8] <= UInt<3>("h04") @[branchpred.scala 37:40]
    _T[9] <= UInt<3>("h04") @[branchpred.scala 37:40]
    _T[10] <= UInt<3>("h04") @[branchpred.scala 37:40]
    _T[11] <= UInt<3>("h04") @[branchpred.scala 37:40]
    _T[12] <= UInt<3>("h04") @[branchpred.scala 37:40]
    _T[13] <= UInt<3>("h04") @[branchpred.scala 37:40]
    _T[14] <= UInt<3>("h04") @[branchpred.scala 37:40]
    _T[15] <= UInt<3>("h04") @[branchpred.scala 37:40]
    _T[16] <= UInt<3>("h04") @[branchpred.scala 37:40]
    _T[17] <= UInt<3>("h04") @[branchpred.scala 37:40]
    _T[18] <= UInt<3>("h04") @[branchpred.scala 37:40]
    _T[19] <= UInt<3>("h04") @[branchpred.scala 37:40]
    _T[20] <= UInt<3>("h04") @[branchpred.scala 37:40]
    _T[21] <= UInt<3>("h04") @[branchpred.scala 37:40]
    _T[22] <= UInt<3>("h04") @[branchpred.scala 37:40]
    _T[23] <= UInt<3>("h04") @[branchpred.scala 37:40]
    _T[24] <= UInt<3>("h04") @[branchpred.scala 37:40]
    _T[25] <= UInt<3>("h04") @[branchpred.scala 37:40]
    _T[26] <= UInt<3>("h04") @[branchpred.scala 37:40]
    _T[27] <= UInt<3>("h04") @[branchpred.scala 37:40]
    _T[28] <= UInt<3>("h04") @[branchpred.scala 37:40]
    _T[29] <= UInt<3>("h04") @[branchpred.scala 37:40]
    _T[30] <= UInt<3>("h04") @[branchpred.scala 37:40]
    _T[31] <= UInt<3>("h04") @[branchpred.scala 37:40]
    reg predictionTable : UInt<3>[32], clock with : (reset => (reset, _T)) @[branchpred.scala 37:32]
    reg lastBranch : UInt, clock @[branchpred.scala 79:23]
    when io.update : @[branchpred.scala 81:20]
      when io.taken : @[branchpred.scala 82:21]
        node _T_1 = or(lastBranch, UInt<5>("h00"))
        node _T_2 = bits(_T_1, 4, 0)
        node _T_3 = neq(predictionTable[_T_2], UInt<3>("h07")) @[branchpred.scala 42:19]
        when _T_3 : @[branchpred.scala 42:30]
          node _T_4 = add(predictionTable[_T_2], UInt<1>("h01")) @[branchpred.scala 43:26]
          node _T_5 = tail(_T_4, 1) @[branchpred.scala 43:26]
          predictionTable[_T_2] <= _T_5 @[branchpred.scala 43:15]
          skip @[branchpred.scala 42:30]
        skip @[branchpred.scala 82:21]
      else : @[branchpred.scala 84:18]
        node _T_6 = or(lastBranch, UInt<5>("h00"))
        node _T_7 = bits(_T_6, 4, 0)
        node _T_8 = neq(predictionTable[_T_7], UInt<1>("h00")) @[branchpred.scala 49:19]
        when _T_8 : @[branchpred.scala 49:28]
          node _T_9 = sub(predictionTable[_T_7], UInt<1>("h01")) @[branchpred.scala 50:26]
          node _T_10 = tail(_T_9, 1) @[branchpred.scala 50:26]
          predictionTable[_T_7] <= _T_10 @[branchpred.scala 50:15]
          skip @[branchpred.scala 49:28]
        skip @[branchpred.scala 84:18]
      skip @[branchpred.scala 81:20]
    node tableIndex = bits(io.pc, 7, 2) @[branchpred.scala 91:25]
    node _T_11 = bits(tableIndex, 4, 0)
    node _T_12 = bits(predictionTable[_T_11], 2, 2) @[branchpred.scala 94:47]
    io.prediction <= _T_12 @[branchpred.scala 94:17]
    lastBranch <= tableIndex @[branchpred.scala 97:14]
    
