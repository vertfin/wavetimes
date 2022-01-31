# Wavetimes

Our Time classes (Wavetimes::T and WaveFile::Duration) only have millisecond resolution, so there will drift as we add files, up to +/- 1ms per track.

TODO: Implement our own wave header reader to increase accuracy.
