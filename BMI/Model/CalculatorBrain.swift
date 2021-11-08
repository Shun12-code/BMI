//
//  CalculatorBrain.swift
//  BMI
//
//  Created by 野村俊介 on 2021/11/08.
//

import UIKit

struct CalculatorBrain {
    
    var bmi:BMI?
//    ここで新しく構造体を作ってるのか謎　：　ここでlet value: Float?とかすれば良くないか
//    → calculateBMIにてbmi=で必要になってくる

    
    func getBMIValue() -> String {
        
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? "0.0")
        return bmiTo1DecimalPlace

    }
    
    func getAdvice() -> String{
        return bmi?.advice ?? "No Advice"
    }
    
    func getColor() -> UIColor{
        return bmi?.color ?? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    
    
//        このreturnがないとエラーになる　→　戻り値のデータ型を指定しているから
//下のcalculateBMIではStringに変換する必要がない処理をするからreturn文は必要ない
//一応下のcalculateBMIにて　bmiの前にreturnを追加してみたらエラーは出なかった　→ 下の場合は省略できる説　→ 多分合ってる
//こっちの関数ではStringに変換するからreturnが必要なのか？
    
    mutating func calculateBMI(height: Float, weight: Float){
        let bmiValue = weight/(pow(height, 2))
       
        if bmiValue < 18.5{
            bmi = BMI(value: bmiValue, advice: "もっとおにぎりを食べて,筋トレしよう！", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        } else if bmiValue < 24.9{
            bmi = BMI(value: bmiValue, advice: "このままの状態をキープしよう！", color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
        } else {
            bmi = BMI(value: bmiValue, advice: "太ってる！運動しよう！", color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
        }
    }
    
}
