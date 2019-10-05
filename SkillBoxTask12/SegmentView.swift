//
//  SegmentView.swift
//  SkillBoxTask12
//
//  Created by Илья Лобков on 20/09/2019.
//  Copyright © 2019 Илья Лобков. All rights reserved.
//

import UIKit

/// Делегат сегментов
protocol SegmentViewDelegate: NSObjectProtocol {
    func pressOneSegmentOne(_ delegate: SegmentView)
    func pressOneSegmentTwo(_ delegate: SegmentView)
}

//@IBDesignable
class SegmentView: UIView {
    
    // MARK: Настройки
    var isSetapt = false
    
    private let labelSegmentOne = UILabel()
    private let labelSegmentTwo = UILabel()
    private let buttonSegmentOne = UIButton()
    private let buttonSegmentTwo = UIButton()
    private let viewBackground = UIView()
    private var segmentControl = UISegmentedControl()
    
    @IBInspectable var сollorBorderView : UIColor = .green
    @IBInspectable var collorBackground : UIColor = .blue
    @IBInspectable var textCollor : UIColor = .black
    @IBInspectable var textSelectCollor : UIColor = .white
    @IBInspectable var nameLabelOne : String = "Сегмент один"
    @IBInspectable var nameLabuleTwo : String =  "Сегмент два"
    
    weak var delegate : SegmentViewDelegate?
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if isSetapt {return}
        isSetapt = true

        let w = frame.size.width
        let h = frame.size.height
        
        // MARK: Настройки сегмент контрола
        segmentControl.frame = CGRect(x: 0, y: 0, width: w, height: h)
        
        // Задаем ячейки SegmentControl
        segmentControl.insertSegment(withTitle: nameLabelOne, at: 1, animated: true)
        segmentControl.insertSegment(withTitle: nameLabuleTwo, at: 2, animated: true)
        
        // Настройка цвета выделения SegmentControl
        if #available(iOS 13.0, *) {
            segmentControl.selectedSegmentTintColor = collorBackground
        } else {
            segmentControl.tintColor = collorBackground
        }
        
        // Настройка обводки
        segmentControl.layer.borderColor = сollorBorderView.cgColor
        segmentControl.layer.borderWidth = 2
        
        segmentControl.selectedSegmentIndex = 0 // Настройка выбранного сегмента
        
        // Задания цветов SegmentControl
        segmentControl.addTarget(self, action: #selector(selectTarget), for: .valueChanged)
        
        let selectTextAttributes = [NSAttributedString.Key.foregroundColor: textSelectCollor]
        let disSelectTextAttributes = [NSAttributedString.Key.foregroundColor: textCollor]
        UISegmentedControl.appearance().setTitleTextAttributes(selectTextAttributes, for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes(disSelectTextAttributes, for: .normal)
      
        // Добавление на вью
        for v in [segmentControl]{
                  addSubview(v)
        }
    }
    
    /// Функция для делегата о том какой сегмент выбран
    /// - Parameter target: Значение какой сегмент выбран
    @objc func selectTarget(target: UISegmentedControl){
        
        switch target.selectedSegmentIndex {
            
        case 0:
            delegate?.pressOneSegmentOne(self)
            //print("Выбран \(target.selectedSegmentIndex + 1) сегмент")
            
        case 1:
            delegate?.pressOneSegmentTwo(self)
            //print("Выбран \(target.selectedSegmentIndex + 1) сегмент")
            
        default:
            return
        }
        
    }

    

}
