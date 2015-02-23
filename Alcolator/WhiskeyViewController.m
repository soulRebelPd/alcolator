//
//  WhiskeyViewController.m
//  Alcolator
//
//  Created by Corey Norford on 2/20/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import "WhiskeyViewController.h"

@interface WhiskeyViewController ()
@end

@implementation WhiskeyViewController
    - (void) viewDidLoad {
        [super viewDidLoad];
        self.title = NSLocalizedString(@"Whiskey", @"whiskey");
    }

    - (void)sliderValueDidChange:(UISlider *)sender {
        NSLog(@"Slider value changed to %f", sender.value);
        
        //NOTE: added to satisfy lesson
        int numberOfBeers = self.beerCountSlider.value;
        NSString *message = [NSString stringWithFormat:NSLocalizedString(@"%d Shots", nil), numberOfBeers];
        self.navigationItem.title = message;
        [self.beerPercentTextField resignFirstResponder];
    }

    - (void)buttonPressed:(UIButton *)sender;
    {
        [self.beerPercentTextField resignFirstResponder];
        
        int numberOfBeers = self.beerCountSlider.value;
        int ouncesInOneBeerGlass = 12;  //assume they are 12oz beer bottles
        
        float alcoholPercentageOfBeer = [self.beerPercentTextField.text floatValue] / 100;
        float ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer;
        float ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers;
        
        float ouncesInOneWhiskeyGlass = 1;  // a 1oz shot
        float alcoholPercentageOfWhiskey = 0.4;  // 40% is average
        
        float ouncesOfAlcoholPerWhiskeyGlass = ouncesInOneWhiskeyGlass * alcoholPercentageOfWhiskey;
        float numberOfWhiskeyGlassesForEquivalentAlcoholAmount = ouncesOfAlcoholTotal / ouncesOfAlcoholPerWhiskeyGlass;
        
        NSString *beerText;
        
        if (numberOfBeers == 1) {
            beerText = NSLocalizedString(@"beer", @"singular beer");
        } else {
            beerText = NSLocalizedString(@"beers", @"plural of beer");
        }
        
        NSString *whiskeyText;
        
        if (numberOfWhiskeyGlassesForEquivalentAlcoholAmount == 1) {
            whiskeyText = NSLocalizedString(@"shot", @"singular shot");
        } else {
            whiskeyText = NSLocalizedString(@"shots", @"plural of shot");
        }
        
        NSString *resultText = [NSString stringWithFormat:NSLocalizedString(@"%d %@ contains as much alcohol as %.1f %@ of whiskey.", nil), numberOfBeers, beerText, numberOfWhiskeyGlassesForEquivalentAlcoholAmount, whiskeyText];
        self.resultLabel.text = resultText;
    }
@end

