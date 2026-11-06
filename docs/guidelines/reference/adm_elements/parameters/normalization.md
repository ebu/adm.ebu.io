# normalization

When the `normalization` is specified as N3D, the following equation is given:

$$
{N_{N3D}}_n^{|m|} = \sqrt{(2n+1) \tfrac{(n-|m|)!}{(n+|m|)!}}
$$

N3D normalization yields a set of orthonormal basis functions. With N3D normalization the higher-order components (n≥0) can have an energy greater than that of the n=0 component, which risks causing clipping distortions when audio data is stored in integer sample formats. 

When the `normalization` is specified as SN3D, the following equation is given:

$$
{N_{SN3D}}_n^{|m|} = \sqrt{\tfrac{(n-|m|)!}{(n+|m|)!}}
$$

SN3D normalization applies a weighting to the HOA components according to the order such that the energy does not exceed that of the n=0 component. 

When the `normalization` is specified as FuMa, the signal was stored with the Furse-Malham (FuMa) weighting. This system of weighting is designed for coefficients not to exceed an absolute value of 1 in panning. It also has a −3 dB weighting of the n = 0 component. It is only defined up to order 3.

| Order (_n_) | Degree ($\lvert{m}\rvert$) | ${N_{FuMa}}_n^{\lvert{m}\rvert}$ Normalization (relative to ${N_{SN3D}}_n^{\lvert{m}\rvert}$) |
|-----------|--------------|-------------------|
| 0 | 0 | $$\frac{1}{\sqrt{2}} {N_{SN3D}}_n^{\lvert{m}\rvert}$$ |
| 1 | 0 | $${N_{SN3D}}_n^{\lvert{m}\rvert}$$ |
| 1 | 1 | $${N_{SN3D}}_n^{\lvert{m}\rvert}$$ |
| 2 | 0 | $${N_{SN3D}}_n^{\lvert{m}\rvert}$$ |
| 2 | 1 | $$\frac{2}{\sqrt{3}} {N_{SN3D}}_n^{\lvert{m}\rvert}$$ |
| 2 | 2 | $$\frac{2}{\sqrt{3}} {N_{SN3D}}_n^{\lvert{m}\rvert}$$ |
| 3 | 0 | $${N_{SN3D}}_n^{\lvert{m}\rvert}$$ |
| 3 | 1 | $$\sqrt{\frac{45}{32}} {N_{SN3D}}_n^{\lvert{m}\rvert}$$ |
| 3 | 2 | $$\frac{3}{\sqrt{5}} {N_{SN3D}}_n^{\lvert{m}\rvert}$$ |
| 3 | 3 | $$\sqrt{\frac{8}{5}} {N_{SN3D}}_n^{\lvert{m}\rvert}$$ |

To reduce the risk of clipping with integer sample formats the SN3D normalization is the default option. Due to its greater dynamic range, N3D normalization is recommended for floating-point sample formats where there is practically no risk of clipping.

