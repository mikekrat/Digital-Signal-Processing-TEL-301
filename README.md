# Digital Signal Processing — TEL-301 (TUC)

Four MATLAB lab projects for the Digital Signal Processing course (2021–2022).
Each lab pairs working code with a written report. **Grades: 10/10 on every
project (reports 10, 9.5, 10, 8).**

Collaborators: [Thomas Chatzis](https://github.com/tchatzis1), Constantinos Mylonas.

## Projects

### Lab 1 — DFT, convolution and spectra
Computing the **DFT/FFT** of signals, performing **convolution**, and inspecting
signals in the time and frequency domains (`fft`, `ifft`, `fftshift`, `conv`).

### Lab 2 — System analysis: frequency response & pole–zero
Analysing discrete systems through their **frequency response** and **pole–zero
plots** (`freqz`, `zplane`).

### Lab 3 — IIR filter design
Designing and applying **IIR filters** (Butterworth / Chebyshev) to meet
lowpass/highpass stopband-attenuation specs, and examining filtering and
**aliasing** (`buttord`, `cheby1`, `filter`, `freqz`).

### Lab 4 — FIR filter design with windowing
Designing **FIR filters** using window functions (Hamming, rectangular) with
`fir1`, applying them and comparing against the IIR approach from Lab 3.

## Layout
```
Project_1/  .m scripts + brief + report
Project_2/  ...
Project_3/  ...
Project_4/  ...
```

## Run
Open the `.m` files for a lab in MATLAB and run them in order; figures reproduce
the plots used in that lab's report.

## Tech
MATLAB · sampling · DFT/FFT · digital filter design · spectral analysis
