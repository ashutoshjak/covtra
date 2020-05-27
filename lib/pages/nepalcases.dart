class NepalCases{

  var tested_positive;
  var tested_negative;
  var tested_total;
  var in_isolation;
  var quarantined;
  var tested_rdt;
  var deaths;
  var recovered;

  NepalCases({this.tested_positive,this.tested_negative,this.tested_total,this.in_isolation,
    this.quarantined,this.tested_rdt ,this.deaths,this.recovered});


  factory NepalCases.fromJson(final jsons){
    return NepalCases(
        tested_positive: jsons["tested_positive"],
        tested_negative: jsons["tested_negative"],
        tested_total: jsons["tested_total"],
        in_isolation: jsons["in_isolation"],
        quarantined: jsons["quarantined"],
        tested_rdt: jsons["tested_rdt"],
        deaths: jsons["deaths"],
        recovered: jsons["recovered"],
    );
  }
}



