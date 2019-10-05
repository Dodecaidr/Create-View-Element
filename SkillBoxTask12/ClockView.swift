//
//  ClockView.swift
//  SkillBoxTask12
//
//  Created by Илья Лобков on 20/09/2019.
//  Copyright © 2019 Илья Лобков. All rights reserved.
//

import UIKit

//@IBDesignable
class ClockView: UIView {
    
    //MARK: назначаем переменные
    var isSetap = false //Константа для добовления
    
    var timer = Timer()
    var dateTime = Date()
    let calendar = Calendar.current
    
    var markerSize:CGFloat = 4
    var markerLenght:CGFloat = 12
    var markerCollor = UIColor.blue
    
   //MARK: переменные для стрелок
    // параметры часа
    @IBInspectable var hourLineWidth : CGFloat = 5
    @IBInspectable var hourLineHight : CGFloat = 110
    @IBInspectable var hourLineCollor :  UIColor? = .green
    @IBInspectable var hours : CGFloat = 2
    
    // параметры минуты
    @IBInspectable var minuteLineWidth : CGFloat = 1
    @IBInspectable var minuteLineHight : CGFloat = 120
    @IBInspectable var minuteLineCollor :  UIColor? = .green
    @IBInspectable var minute : CGFloat = 3
    
    // параметры секунд
    @IBInspectable var secondLineWidth : CGFloat = 4
    @IBInspectable var secondLineHight : CGFloat = 120
    @IBInspectable var secondLineCollor :  UIColor? = .green
    @IBInspectable var second : CGFloat = 6

    //MARK: Создаем маркеры времени (12,3,6,9) и стрелки часов
    private let topMarker = UIView()
    private let leftMarker = UIView()
    private let rightMarker = UIView()
    private let bottomMarker = UIView()
    
    private let hourLine = UIView()
    private let minuteLine = UIView()
    private let secondLine = UIView()
    
    private let roundetView = UIView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        if isSetap {return}
        isSetap = true
        
        let w = frame.size.width
        let h = frame.size.height
        
        //MARK: положение стрелок
        hourLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        minuteLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        secondLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        
       
        //MARK: размеры стрелок
        // размеры часовой стрелки
        hourLine.frame = CGRect(x: w / 2 - hourLineWidth / 2, y: h / 2 - hourLineHight , width: hourLineWidth , height: hourLineHight)
        hourLine.backgroundColor = hourLineCollor
        updateHour()
        
        
        //размеры минутной стрелки
        minuteLine.frame = CGRect(x: w / 2 - minuteLineWidth / 2, y: h / 2 - minuteLineHight , width: minuteLineWidth , height: minuteLineHight)
        minuteLine.backgroundColor = minuteLineCollor
        updateMin()
        
        // размеры секундной стрелки
        secondLine.frame = CGRect(x: w / 2 - secondLineWidth / 2, y: h / 2 - secondLineHight , width: secondLineWidth , height: secondLineHight)
        secondLine.backgroundColor = secondLineCollor
        updateSec()
        
        //размер кружочка
        roundetView.frame = CGRect(x: w / 2 - 8, y: h / 2 - 8, width: 16, height: 16)
        roundetView.backgroundColor = secondLineCollor
        roundetView.layer.cornerRadius = 8
        
        //MARK: размеры маркеров времени
        topMarker.frame = CGRect(x: w / 2 - markerSize / 2, y: 0, width: markerSize, height: markerLenght)
        leftMarker.frame = CGRect(x: 0, y: h / 2 - markerSize / 2, width: markerLenght, height: markerSize)
        rightMarker.frame = CGRect(x: w - markerLenght, y: h / 2 - markerSize / 2, width: markerLenght, height: markerSize)
        bottomMarker.frame = CGRect(x: w / 2 - markerSize / 2, y: h - markerLenght , width: markerSize, height: markerLenght)
        
        layer.cornerRadius = frame.size.width / 2 // придаем часам круглый вид
        
        //MARK: добавление наших элеменнотв и задание цвета маркерам
        for v in [topMarker,leftMarker,rightMarker,bottomMarker]{
            v.backgroundColor = markerCollor

        }
        
        for v in [topMarker,leftMarker,rightMarker,bottomMarker,hourLine,minuteLine,secondLine, roundetView]{
            addSubview(v)
        }
        timerUpdate()
        
    }
    
    
    func updateHour(){
        UIView.animate(withDuration: 0.1) {
            let angelHour = CGFloat.pi * 2 * (self.hours / CGFloat(12))
            self.hourLine.transform = CGAffineTransform(rotationAngle: angelHour)
        }
    }
    
    func updateMin(){
        UIView.animate(withDuration: 0.1) {
            let angelMin = CGFloat.pi * 2 * (self.minute / CGFloat(60))
            self.minuteLine.transform = CGAffineTransform(rotationAngle: angelMin)
        }
    }
    
    func updateSec(){
        UIView.animate(withDuration: 0.1) {
            let angelSec = CGFloat.pi * 2 * (self.second / CGFloat(60))
            self.secondLine.transform = CGAffineTransform(rotationAngle: angelSec)
        }
    }
    
    //MARK: Функция для переопределения времени для работы часов
    /// Переопределение времени
    func timerUpdate() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (Timer) in
            self.hours = CGFloat(self.calendar.component(.hour, from: self.dateTime))
                                   self.minute = CGFloat(self.calendar.component(.minute, from: self.dateTime))
            self.second = CGFloat(self.calendar.component(.second, from: self.dateTime))
            self.layoutIfNeeded()
            self.updateHour()
            self.updateMin()
            self.updateSec()
            self.dateTime = Date()
        }
    }

}
