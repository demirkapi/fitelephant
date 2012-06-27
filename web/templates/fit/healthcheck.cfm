<div class="row-fluid">
    <div class="span3">
        <cfinclude template="../../templates/#application.settings.template#/leftnav.cfm">
    </div>
    <div class="span9">
        <div class="row-fluid">
            <div class="span9">
                <h2>Sağlıklı mıyız?</h2>
                <p>
        Herşey karar vermekle başlıyor. Karar verilip de inandıktan sonra başarmak sadece zaman. Bu arada kararlılığın hayatımızı düzenlediği ve herşeyi yoluna koyduğunu görmenin de keyfini alabiliyoruz. 
<br />
<br />
Ama asıl sorun nasıl karar vereceğimiz ve nerden başlayabileceğimiz. Gerçekten sağlıklı mıyım sorusu karar vermek adına başlangıç olacak bir nokta olucaktır. Sağlıklı olmanın tanımını algılayabilmek ve aslında bizim için en önemli olan şey vucudumuza daha fazla özen göstermemiz, başlamak için kendimiz ikna etmek adına iyi bir nokta olucaktır. 
<br />
<br />
Farklı tanımları olabilecek olsa da sağlıklı olmanın temel belirtisi vucudumuzun tanımlanan değerler içerisinde olup olmamasıdır. Özellikle fazla kilolarımız belirlenen sınırların dışında olduğunda gerek kiloların bizde yarattığı rahatsız edici etkiler, gerek fazla kiloların neden olduğu diğer hastalıklar, gerekse de fiziksel görünümümüz ve yarattığı sosyal etkiler.
<br />
<br />
Siz de kendi ölçülerinizi sisteme girerek ya da tabloyu inceleyerek hangi durumda olduğunu verilere dayanarak aşağıda görebilirsiniz. 
<br />
<script type="text/javascript">
function  calculateBMI() {
  var weight = eval(document.form.weight.value)
  var height = eval(document.form.height.value)
  var height2 = height / 100
  var BMI = weight  / (height2 * height2)
  document.form.BodyMassIndex.value=custRound(BMI,1);
}

function custRound(x,places) {
  return (Math.round(x*Math.pow(10,places)))/Math.pow(10,places)
}
// End -->
</script>



 <cfscript>
 	kgStart = 40;
	kgEnd = 130;
	cmStart = 140;
	cmEnd = 210;
 </cfscript>

<cffunction name="bmiStatus" output="no" returntype="String" hint="detect BMI status">
	<cfargument name="bmi" type="numeric">
	<cfif bmi LTE 16>
		<cfset status = 'su'>
	</cfif>
	<cfif bmi GT 16 AND bmi LTE 20>
		<cfset status = 'u'>
	</cfif>    
	<cfif bmi GT 20 AND bmi LTE 25>
		<cfset status = 'n'>
	</cfif>
	<cfif bmi GT 25 AND bmi LTE 30>
		<cfset status = 'ov'>
	</cfif>
	<cfif bmi GT 30 AND bmi LTE 35>
		<cfset status = 'ob1'>
	</cfif>    
	<cfif bmi GT 35 AND bmi LTE 40>
		<cfset status = 'ob2'>
	</cfif>        
	<cfif bmi GT 40>
		<cfset status = 'ob3'>
	</cfif>
    <cfreturn status>
</cffunction>

<div style="float:left;">
<cfoutput>
<table class="table table-condensed">
<tr>
	<td colspan="20" align="center"><h4>BMI TABLOSU</h4></td>
</tr>
<tr>
	<td></td>
<cfloop index="ix" from="#cmStart#" to="#cmEnd#" step="5">
	<td class="bmi_x" nowrap>#ix# cm</td>
</cfloop>
</tr>
<cfloop index="iy" from="#kgStart#" to="#kgEnd#" step="5">
<tr>
	<td class="bmi_y" nowrap>#iy# kg</td>	
    <cfloop index="ix" from="#cmStart#" to="#cmEnd#" step="5">
    	<cfscript>
        	alt = (ix/100)*(ix/100);
			bmi = iy /alt;
        </cfscript>
    <td class="bmi_#bmiStatus(bmi)#">#decimalFormat(bmi)#</td>
	</cfloop>
</tr>    
</cfloop>
</table>
</cfoutput>
</div>
<div style="float:left;">
<table style="margin:30px; width:200px; border:1px solid #cde; padding:5px 15px;;">
<form  name="form" id="form">
<tr>
	<td colspan="2" align="center"><h4>BMI HESAPLA</h4></td>
</tr>
<tr>
	<td align="right"><input type="Text" name="weight" class="span6"></td>
	<td nowrap="nowrap">Ağırlık (kg)</td>    
</tr>
<tr>
	<td align="right"><input type="Text" name="height" class="span6"></td>
    <td nowrap="nowrap">Uzunluk (cm)</td>
</tr>
<tr>
	<td align="right">BMI <input type="Text" name="BodyMassIndex" id="BodyMassIndex" class="span6"></td>
    <td><input type="button" value="Hesapla" onClick="calculateBMI()" name="button" class="btn"></td>
</tr>
</form>
</table>
</div>
<div style="float:left;">
<table style="margin:30px; width:200px; border:1px solid #cde; padding:5px 15px;;">
	<tr>
	    <td class="bmi_su">Aşırı Zayıf</td>
		<td class="bmi_su">16'dan az</td>        
    </tr>
	<tr>
	    <td class="bmi_u">Zayıf</td>
		<td class="bmi_u">16 20 arası</td>        
    </tr>    
	<tr>
	    <td class="bmi_n">Normal</td>
		<td class="bmi_n">20 25 arası</td>        
    </tr>        
	<tr>
	    <td class="bmi_ov">Kilolu</td>
		<td class="bmi_ov">25 30 arası</td>        
    </tr>            
	<tr>
	    <td class="bmi_ob1">Obez tip 1</td>
		<td class="bmi_ob1">30 35 arası</td>        
    </tr>                
	<tr>
	    <td class="bmi_ob2">Obez tip 2</td>
		<td class="bmi_ob2">35 40 arası</td>        
    </tr>                
	<tr>
	    <td class="bmi_ob3">Obez tip 3</td>
		<td class="bmi_ob3">40 ve üzeri</td>        
    </tr>                
</table>
</div>

<br clear="all" />
<br />

Eğer obez kategorilerinden birisinde iseniz bir an önce önlem alıp sağlıklı olmak adına kendinize karşı sorumluluğunuzu yerine getirmeye başlamalısınız. 
<br />
<br />
Obez 2 ve 3 tipleri içerisinde yer alıyorsanız da doğrudan konunun uzmanlarına ulaşıp profesyonel yardım almaya başlamanız sağlığınız açısından çok önemlidir.
</p>
<br />
<h4>Siz de sağlıklı olmayı hakediyorsunuz!</h4>
<h4>Sizi bize katılıp kendinizi dünyanın en değerli insanı yapmaya davet ediyoruz!</h4>
        
        <br /><br />
        </div>
    </div>
</div>
