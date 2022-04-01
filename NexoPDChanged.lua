plr = game.Players.LocalPlayer
char=game.Players.LocalPlayer.Character
ct={}
te=table.insert
_G.Velocity = Vector3.new(35,0,0)

HumanDied=false
if not _G.Velocity then _G.Velocity = Vector3.new(35,0,0) end
for i,v in next, game:GetService("Players").LocalPlayer.Character:GetDescendants() do
if v:IsA("BasePart") or v:IsA("MeshPart") then 
te(ct,game:GetService("RunService").Heartbeat:connect(function()
pcall(function()
v.Velocity = _G.Velocity
sethiddenproperty(game.Players.LocalPlayer,"MaximumSimulationRadius",math.huge)
sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",999999999)
game.Players.LocalPlayer.ReplicationFocus = workspace
end)
end))
end
end

function notify(t,tex,dur)
game.StarterGui:SetCore("SendNotification", {
    Title = t; 
    Text = tex; 
    Duration = dur or 5;
})
end

local srv= game:GetService("RunService")

fl=Instance.new('Folder',char);fl.Name='CWExtra'

char.Archivable = true
local reanim = char:Clone()
reanim.Name='NexoPD'

for i,v in next, reanim:GetDescendants() do
if v:IsA('BasePart') or v:IsA('Decal') then
v.Transparency = 1 
end 
end

--flinge = false

penis=5.65
plr.Character=nil
plr.Character=char
char.Humanoid.AutoRotate=false
char.Humanoid.WalkSpeed=0
char.Humanoid.JumpPower=0
char.Torso.Anchored = true
notify('Nexo','Reanimating...\nPlease wait '..penis..' seconds.')
wait(penis)
char.Torso.Anchored=false
notify('Nexo','Reanimated..')
char.Humanoid.Health=0
--reanim.Humanoid.AutoRotate=false
reanim.Parent = fl
reanim.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame*CFrame.new(0,5,0)





--  Using Mizt's align
local CountSCIFIMOVIELOL = 1
function AlignCharacter(Part0,Part1,Position,Angle)
    local AlignPos = Instance.new('AlignPosition', Part1); AlignPos.Name = "AliP_"..CountSCIFIMOVIELOL
    AlignPos.ApplyAtCenterOfMass = true;
    AlignPos.MaxForce = 5772000--67752;
    AlignPos.MaxVelocity = math.huge/9e110;
    AlignPos.ReactionForceEnabled = false;
    AlignPos.Responsiveness = 200;
    AlignPos.RigidityEnabled = false;
    local AlignOri = Instance.new('AlignOrientation', Part1); AlignOri.Name = "AliO_"..CountSCIFIMOVIELOL
    AlignOri.MaxAngularVelocity = math.huge/9e110;
    AlignOri.MaxTorque = 5772000
    AlignOri.PrimaryAxisOnly = false;
    AlignOri.ReactionTorqueEnabled = false;
    AlignOri.Responsiveness = 200;
    AlignOri.RigidityEnabled = false;
    local AttachmentA=Instance.new('Attachment',Part1); AttachmentA.Name = "AthP_"..CountSCIFIMOVIELOL
    local AttachmentB=Instance.new('Attachment',Part0); AttachmentB.Name = "AthP_"..CountSCIFIMOVIELOL
    local AttachmentC=Instance.new('Attachment',Part1); AttachmentC.Name = "AthO_"..CountSCIFIMOVIELOL
    local AttachmentD=Instance.new('Attachment',Part0); AttachmentD.Name = "AthO_"..CountSCIFIMOVIELOL
    AttachmentC.Orientation = Angle
    AttachmentA.Position = Position
    AlignPos.Attachment1 = AttachmentA;
    AlignPos.Attachment0 = AttachmentB;
    AlignOri.Attachment1 = AttachmentC;
    AlignOri.Attachment0 = AttachmentD;
    CountSCIFIMOVIELOL = CountSCIFIMOVIELOL + 1
end


for i,part in next, char:GetDescendants() do
if part:IsA('BasePart') then
te(ct,srv.RenderStepped:Connect(function()
part.CanCollide=false
end))
end
end

for i,part in next, char:GetDescendants() do
if part:IsA('BasePart') then
te(ct,srv.Stepped:Connect(function()
part.CanCollide=false
end))
end
end

for i,part in next, reanim:GetDescendants() do
if part:IsA('BasePart') then
te(ct,srv.RenderStepped:Connect(function()
part.CanCollide=false
end))
end
end

for i,part in next, reanim:GetDescendants() do
if part:IsA('BasePart') then
te(ct,srv.Stepped:Connect(function()
part.CanCollide=false
end))
end
end

for i,v in next, char:GetDescendants() do
if v:IsA('Accessory') then
AlignCharacter(v.Handle,reanim[v.Name].Handle,Vector3.new(0,0,0),Vector3.new(0,0,0))
end
end

--Pos(fhrp,reanim['Torso'])
AlignCharacter(char['Head'],reanim['Head'],Vector3.new(0,0,0),Vector3.new(0,0,0))
AlignCharacter(char['Torso'],reanim['Torso'],Vector3.new(0,0,0),Vector3.new(0,0,0))
AlignCharacter(char['HumanoidRootPart'],reanim['Torso'],Vector3.new(0,0,0),Vector3.new(0,0,0))
AlignCharacter(char['Right Arm'],reanim['Right Arm'],Vector3.new(0,0,0),Vector3.new(0,0,0))
AlignCharacter(char['Left Arm'],reanim['Left Arm'],Vector3.new(0,0,0),Vector3.new(0,0,0))
AlignCharacter(char['Right Leg'],reanim['Right Leg'],Vector3.new(0,0,0),Vector3.new(0,0,0))
AlignCharacter(char['Left Leg'],reanim['Left Leg'],Vector3.new(0,0,0),Vector3.new(0,0,0))

m = plr:GetMouse()

local LVecPart = Instance.new("Part", fl) LVecPart.CanCollide = false LVecPart.Transparency = 1

te(ct,srv.RenderStepped:Connect(function()
local lookVec = workspace.CurrentCamera.CFrame.lookVector
local Root = reanim["HumanoidRootPart"]
LVecPart.Position = Root.Position
LVecPart.CFrame = CFrame.new(LVecPart.Position, Vector3.new(lookVec.X * 10000, lookVec.Y, lookVec.Z * 10000))
end))



--reanim.HumanoidRootPart.RootJoint.Part0=nil

function flinger(p)
f=Instance.new('BodyAngularVelocity',p)
f.AngularVelocity = Vector3.new(9e9,9e9,9e9)
f.MaxTorque=Vector3.new(9e9,9e9,9e9)
end

flinger(char.HumanoidRootPart)

m=plr:GetMouse()

--char.HumanoidRootPart.Transparency = 0

bp=Instance.new('BodyPosition',char.HumanoidRootPart)
bp.P = 9e9
bp.D = 9e9
bp.MaxForce=Vector3.new(99999,99999,99999)

local click

te(ct,srv.Heartbeat:Connect(function()
if click == true then
bp.Position=m.Hit.p
char.HumanoidRootPart.Position=m.Hit.p
else
bp.Position=reanim.Torso.Position
char.HumanoidRootPart.Position=reanim.Torso.Position
end
end))

local Highlight = Instance.new("SelectionBox")
Highlight.Adornee = char.HumanoidRootPart
Highlight.LineThickness=0.05
Highlight.Color3 = Color3.fromRGB(30,255,30)
Highlight.Parent = char.HumanoidRootPart
Highlight.Name = "RAINBOW"

hrp = Highlight

spawn(function()
while true do
srv.Stepped:Wait()
if ded then break end
hrp.Color3 = Color3.new(255/255,0/255,0/255)
for i = 0,255,10 do
wait()
hrp.Color3 = Color3.new(255/255,i/255,0/255)
end
for i = 255,0,-10 do
wait()
hrp.Color3 = Color3.new(i/255,255/255,0/255)
end
for i = 0,255,10 do
wait()
hrp.Color3 = Color3.new(0/255,255/255,i/255)
end
for i = 255,0,-10 do
wait()
hrp.Color3 = Color3.new(0/255,i/255,255/255)
end
for i = 0,255,10 do
wait()
hrp.Color3 = Color3.new(i/255,0/255,255/255)
end
for i = 255,0,-10 do
wait()
hrp.Color3 = Color3.new(255/255,0/255,i/255)
end
end
end)

te(ct,m.Button1Down:Connect(function()
click=true
end))

te(ct,m.Button1Up:Connect(function()
click=false
end))

char.Animate.Disabled = true

game:GetService("UserInputService").JumpRequest:connect(function(t)
    if reanim.Humanoid.FloorMaterial~=Enum.Material.Air then 
        reanim.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        game.Players.LocalPlayer.Character.CWExtra.NexoPD:FindFirstChildOfClass('Humanoid').Sit=false 
    end 
end)

game.RunService.RenderStepped:Connect(function()
    reanim.Humanoid:Move(char.Humanoid.MoveDirection,false)
    local animtracks = char.Humanoid:GetPlayingAnimationTracks()
        for n,l in pairs(animtracks) do 
            l:Stop()
        end 
end)

--reanim.HumanoidRootPart.RootJoint.Part1=nil

workspace.CurrentCamera.CameraSubject = reanim.Humanoid

reset=Instance.new('BindableEvent')
te(ct,reset.Event:Connect(function()
reanim:Destroy()
HumanDied=true
reanimated=false
for i,v in next, char:GetDescendants() do if v:IsA('BasePart') then v.Anchored=true end end
hc=char.Humanoid:Clone()
char.Humanoid:Destroy()
hc.Parent=char
game.Players:Chat('-re')
for i,v in pairs(ct) do v:Disconnect() end
game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
reset:Remove()
end))

game:GetService("StarterGui"):SetCore("ResetButtonCallback", reset)
