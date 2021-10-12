class Country {
	List<String>? callingCodes;
	String? name;
	String? alpha2Code;
	String? alpha3Code;
	String? flag;

	Country({
		this.callingCodes, 
		this.name, 
		this.alpha2Code, 
		this.alpha3Code, 
		this.flag, 
	});

	factory Country.fromJson(Map<String, dynamic> json) => Country(
				callingCodes: json['callingCodes'] as List<String>?,
				name: json['name'] as String?,
				alpha2Code: json['alpha2Code'] as String?,
				alpha3Code: json['alpha3Code'] as String?,
				flag: json['flag'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'callingCodes': callingCodes,
				'name': name,
				'alpha2Code': alpha2Code,
				'alpha3Code': alpha3Code,
				'flag': flag,
			};
}
