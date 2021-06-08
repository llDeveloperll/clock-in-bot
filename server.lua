local expectedID = 518

local actual_handlings = {
	mass=3000,
	turnMass=3000, 
	dragCoeff=1.8, 
	centerOfMass={0, 0.15, -0.3}, 
	percentSubmerged=75,
	tractionMultiplier=1.1, 
	tractionLoss=0.9, 
	tractionBias=0.46,
	numberOfGears=5, 
	maxVelocity=400, 
	engineAcceleration=23,
	engineInertia=10, 
	driveType="awd", 
	engineType="diesel",
	brakeDeceleration=30, 
	ABS=true, 
	steeringLock=35,
	suspensionForceLevel=2, 
	suspensionDamping=0.9,
	suspensionHighSpeedDamping=2, 
	suspensionUpperLimit=0.3, 
	suspensionLowerLimit=-0.1,
	suspensionFrontRearBias=0.5,
	suspensionAntiDiveMultiplier=1,
	animGroup=0,
}

local handlings = {
	mass=1500,
	turnMass=3500,
	dragCoeff=1.3,
	centerOfMass={0, 0.20, -0.10},
	percentSubmerged=1,
	tractionMultiplier=0.80,
	tractionLoss=0.70,
	tractionBias=0.50,
	numberOfGears=5,
	maxVelocity=300,
	engineAcceleration=25,
	engineInertia=100,
	driveType="awd", 
	engineType="petrol",
	brakeDeceleration=4.0,
	brakeBias=0.70,
	ABS=false, 
	steeringLock=35,
	suspensionForceLevel=1.35,
	suspensionDamping=0.200,
	suspensionHighSpeedDamping=2,
	suspensionUpperLimit=0.35, 
	suspensionLowerLimit=-0.10, 
	suspensionFrontRearBias=0.5,
	suspensionAntiDiveMultiplier=1,
	animGroup=0, 
}

local new_handling = {
	mass=3000,
	turnMass=3000, 
	dragCoeff=1.8, 
	centerOfMass={0, 0.20, -0.3}, 
	tractionMultiplier=1.3, 
	tractionLoss=0.9, 
	tractionBias=0.45,
	numberOfGears=5, 
	maxVelocity=300, 
	engineAcceleration=16.3,
	engineInertia=4, 
	driveType="rwd", 
	engineType="petrol",
	brakeDeceleration=30,
	brakeBias = 0.70,
	ABS=false, 
	steeringLock=35,
	suspensionForceLevel=1.35,
	suspensionDamping=0.200,
	suspensionHighSpeedDamping=2,
	suspensionUpperLimit=0.08, 
	suspensionLowerLimit=-0.10, 
	suspensionFrontRearBias=0.5,
	suspensionAntiDiveMultiplier=1,
	animGroup=0, 
}

function loadHandling(vehicle)
	if vehicle and getElementModel(vehicle) == expectedID then
		for i,v in pairs(new_handling) do
			setVehicleHandling(vehicle,i,v)		
		end		
		setElementData(vehicle,"vehicle:upgrades",{turbo=true,als=true})
		setVehicleColor(vehicle,0,0,0)
		setVehicleHeadLightColor(vehicle,32,195,139)
		--addVehicleUpgrade(vehicle,1162)
		addVehicleUpgrade(vehicle,1096)
		return true
	end	
	return false
end

addEventHandler("onVehicleEnter", getRootElement(),
function()
	loadHandling(source)
end)

addEventHandler("onResourceStart", getResourceRootElement(getThisResource()),
function()
	for i,p in ipairs(getElementsByType("player")) do
		if isPedInVehicle(p) then
			loadHandling(getPedOccupiedVehicle(p))
		end
	end
end)

--[[

Mass = 1500.0
Turn Mass = 3500.0
Drag Multiplier	= 2.2
(Center Of Mass) x, y, z, submerged = 0.0, 0.3,	-0.15, 75
(Traction) Multiplier, Loss, Bias =  0.65, 0.9, 0.5
(Transmission) # of gears, Max velocity, Acceleration, Inertia, Drive type, Engine type = 5, 200.0, 28.0, 5.0,	Rear, Petrol
(Brakes) Deceleration, Bias, ABS = 8.0, 0.5, 0
Steering Lock = 35.0
(Suspension) Force level, Damping level, High speed = 1.0, 0.20, 0.0
(Suspension Lines) Upper limit, Lower limit, Bias = 0.28, -0.10, 0.5
anti-dive = 0.3
Seat offset distance = 0.25
Collision damage multiplier = 0.60
Monetary Value = 35000
Model flags = 40002804
Handling flags = 4000001
(Lights) Front Rear, Anim, group = Small, Small, 1

Mass = 1500
Turn Mass = 3500
Drag Multiplier	= 1.3
(Center Of Mass) x, y, z, submerged = 0, 0.20, -0.10, -1
(Traction) Multiplier, Loss, Bias =  0.80, 0.70, 0.50
(Transmission) # of gears, Max velocity, Acceleration, Inertia, Drive type, Engine type = 5, 300, 25, 100, 4(quatro rodas), Petrol
(Brakes) Deceleration, Bias, ABS = 4.0, 0.70, 0
Steering Lock = 35.0
(Suspension) Force level, Damping level, High speed = 1.35, 0.200, 2
(Suspension Lines) Upper limit, Lower limit, Bias = 0.35, -0.10, 0.5
anti-dive = 0.1
Seat offset distance = 0.25
Collision damage multiplier = 0
Monetary Value = 35000
Model flags = 40002804
Handling flags = 5000001
(Lights) Front Rear, Anim, group = 1	1	1
	


	3000  3000  1.8 0 0.20 -0.3 1.1 0.9 0.46	5	300	25	100	4	P	4.0	0.70	0	35.0	1.35	0.200	2	0.35	-0.10	0.5	0.1	0.25	0	35000	40002804	5000001	1	1	1
	
	3000  3000  1.8 0 0.20 -0.3 1.1 0.9 0.46	5	300	25	100	4	P	4.0	0.70	0	35.0	1.35	0.200	2	0.35	-0.10	0.5	0.1	0.25	0	35000	40002804	5000001	1	1	1

	
	300030001.800.20-0.31.10.90.465300251004P4.00.70035.01.350.20020.35-0.100.50.10.25035000400028045000001111

	BUCCANEE 3000 3000 1.8 0 0.2 -0.3 70 1.1 0.9 0.46 5 300 25 10 4 p 30 0.7 false 35 1.35 0.200 2 0.35 0.10 0.5 1 0.3 0.52 19000 40400004 4 1 1 1

	
	suspensionFrontRearBias=0.5
	suspensionAntiDiveMultiplier=1
	animGroup=0

	mass=3000,
	turnMass=3000, 
	dragCoeff=1.8, 
	centerOfMass={0, 0.20, -0.3}, 
	tractionMultiplier=1.3, 
	tractionLoss=0.9, 
	tractionBias=0.45,
	numberOfGears=5, 
	maxVelocity=300, 
	engineAcceleration=16.3,
	engineInertia=4, 
	driveType="rwd", 
	engineType="petrol",
	brakeDeceleration=30,
	brakeBias = 0.70,
	ABS=false, 
	steeringLock=35,
	suspensionForceLevel=1.35,
	suspensionDamping=0.200,
	suspensionHighSpeedDamping=2,
	suspensionUpperLimit=0.08, 
	suspensionLowerLimit=-0.10, 
	suspensionFrontRearBias=0.5,
	suspensionAntiDiveMultiplier=1,
	animGroup=0, 

3000	3000	1.8	0	0.20	-0.30	-1	1.30	0.90	0.45	5	300	21	4	4	P	30.0	0.70	0	35.0	1.35	0.200	2	0.35	-0.10	0.5	0.1	0.25	0	35000	40002804	5000001	1	1	1
	
3000	3000	1.8	0	0.20	-0.30	-1	1.30	0.90	0.45	5	170	15	10	4	P	30.0	0.70	0	35.0	1.35	0.200	2	0.35	-0.10	0.5	0.1	0.25	0	35000	40002804	5000001	1	1	1

1500	3500	1.3	0	0.20	-0.10	-1	0.80	0.70	0.50	5	300	25	100	4	P	4.0	0.70	0	35.0	1.35	0.200	2	0.35	-0.10	0.5	0.1	0.25	0	35000	40002804	5000001	1	1	1



15900.0 16516.0 3.0 0.0 0.2 0.2 75 0.25 1.5 0.532 5 200.0 31.0 18.0 R D 4.0 0.72 0 40.0 0.48 0.07 0.0 0.17 -0.27 0.54 0.0 0.25 0.08 35000 40002824 04100001 1 1 0

15900.0 16516.0 3.0 0.0 0.2 0.2 75 0.25 1.5 0.532 5 200.0 31.0 18.0 R D 4.0 0.72 0 40.0 0.48 0.07 0.0 0.17 -0.27 0.54 0.0 0.25 0.08 35000 40002824 04100001 1 1 0

	mass=15900.0,
	turnMass=16516.0, 
	dragCoeff=3.0, 
	centerOfMass={0.0 0.2 0.2}, 
	tractionMultiplier=1.1, 
	tractionLoss=0.9, 
	tractionBias=0.532,
	numberOfGears=5, 
	maxVelocity=200.0, 
	engineAcceleration=21.0,
	engineInertia=18.0, 
	driveType="rwd", 
	engineType="diesel",
	brakeDeceleration=4.0,
	brakeBias = 0.72,
	ABS=false, 
	steeringLock=40.0,
	suspensionForceLevel=0.48,
	suspensionDamping=0.07,
	suspensionHighSpeedDamping=0.0,
	suspensionUpperLimit=0.17, 
	suspensionLowerLimit=-0.27, 
	suspensionFrontRearBias=0.54,
	suspensionAntiDiveMultiplier=1,
	animGroup=0, 

]]