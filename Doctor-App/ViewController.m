//
//  ViewController.m
//  Doctor-App
//
//  Created by Lukas Carvajal on 6/19/15.
//  Copyright (c) 2015 Lukas Carvajal. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *symptoms;
@property (weak, nonatomic) IBOutlet UITextField *medications;

@property NSArray *symptomData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // initialize symptom data
    if(!_symptomData) {
        _symptomData = @[@"anxiety", @"lightheadedness", @"fatigue", @"runny nose", @"jaw pain", @"hot flashes"];
        _medications.text = @"Xanax, Klonopin, Valium";  // anxiety
    }
    
    // connect data
    self.symptoms.dataSource = self;
    self.symptoms.delegate = self;
    
    // change background color
    self.symptoms.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (long)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;   // number of components
}

- (long)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _symptomData.count;  // number of rows
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return _symptomData[row];   // titles for rows
}

// respond to user selecting row
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    if (row == 0) {
        _medications.text = @"Xanax, Klonopin, Valium";  // anxiety
    }
    else if (row == 1) {
        _medications.text = @"Water";  // lightheadedness
    }
    else if (row == 2) {
        _medications.text = @"Adderall, Dexedrine";  // fatigue
    }
    else if (row == 3) {
        _medications.text = @"Mucinex, Zyrtec, NyQuil";  // runny nose
    }
    else if (row == 4) {
        _medications.text = @"Tylenole, Advil";  // jaw pain
    }
    else if (row == 5) {
        _medications.text = @"Estroven, Brisdelle";  // hot flashes
    }
    else {
        _medications.text = @"";
    }
    
}

@end
